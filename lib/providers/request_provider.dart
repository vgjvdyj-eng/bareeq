import 'package:flutter/foundation.dart';
import 'package:bareeq/models/request_model.dart';
import 'package:bareeq/models/enums.dart';

class RequestProvider extends ChangeNotifier {
final List<RequestModel> _requests = [];

List<RequestModel> get requests => List.unmodifiable(_requests);

List<RequestModel> requestsForHost(String hostId) {
return _requests.where((request) => request.hostId == hostId).toList();
}

List<RequestModel> get pendingRequests {
return _requests
.where((request) => request.status == RequestStatus.pending)
.toList();
}

List<RequestModel> requestsForRescuer(String rescuerId) {
return _requests
.where((request) => request.rescuerId == rescuerId)
.toList();
}

void addRequest({
required String hostId,
required ServiceType serviceType,
required String description,
required String location,
required DateTime requestedDate,
required String requestedTime,
required double offeredPrice,
}) {
final request = RequestModel(
id: DateTime.now().millisecondsSinceEpoch.toString(),
hostId: hostId,
serviceType: serviceType,
description: description,
location: location,
requestedDate: requestedDate,
requestedTime: requestedTime,
offeredPrice: offeredPrice,
minimumPrice: serviceType.minimumPrice,
status: RequestStatus.pending,
createdAt: DateTime.now(),
);

_requests.add(request);
notifyListeners();

}

void acceptRequest(String requestId, String rescuerId) {
final index = _requests.indexWhere((request) => request.id == requestId);

if (index == -1) return;

final oldRequest = _requests[index];

_requests[index] = RequestModel(
  id: oldRequest.id,
  hostId: oldRequest.hostId,
  rescuerId: rescuerId,
  serviceType: oldRequest.serviceType,
  description: oldRequest.description,
  location: oldRequest.location,
  requestedDate: oldRequest.requestedDate,
  requestedTime: oldRequest.requestedTime,
  offeredPrice: oldRequest.offeredPrice,
  minimumPrice: oldRequest.minimumPrice,
  status: RequestStatus.accepted,
  createdAt: oldRequest.createdAt,
);

notifyListeners();

}

void startRequest(String requestId) {
_updateStatus(requestId, RequestStatus.inProgress);
}

void completeRequest(String requestId) {
final index = _requests.indexWhere((request) => request.id == requestId);

if (index == -1) return;

final oldRequest = _requests[index];

_requests[index] = RequestModel(
  id: oldRequest.id,
  hostId: oldRequest.hostId,
  rescuerId: oldRequest.rescuerId,
  serviceType: oldRequest.serviceType,
  description: oldRequest.description,
  location: oldRequest.location,
  requestedDate: oldRequest.requestedDate,
  requestedTime: oldRequest.requestedTime,
  offeredPrice: oldRequest.offeredPrice,
  minimumPrice: oldRequest.minimumPrice,
  status: RequestStatus.completed,
  createdAt: oldRequest.createdAt,
  completedAt: DateTime.now(),
);

notifyListeners();

}

void cancelRequest(String requestId) {
_updateStatus(requestId, RequestStatus.cancelled);
}

void _updateStatus(String requestId, RequestStatus newStatus) {
final index = _requests.indexWhere((request) => request.id == requestId);

if (index == -1) return;

final oldRequest = _requests[index];

_requests[index] = RequestModel(
  id: oldRequest.id,
  hostId: oldRequest.hostId,
  rescuerId: oldRequest.rescuerId,
  serviceType: oldRequest.serviceType,
  description: oldRequest.description,
  location: oldRequest.location,
  requestedDate: oldRequest.requestedDate,
  requestedTime: oldRequest.requestedTime,
  offeredPrice: oldRequest.offeredPrice,
  minimumPrice: oldRequest.minimumPrice,
  status: newStatus,
  createdAt: oldRequest.createdAt,
  completedAt: oldRequest.completedAt,
);

notifyListeners();

}
}

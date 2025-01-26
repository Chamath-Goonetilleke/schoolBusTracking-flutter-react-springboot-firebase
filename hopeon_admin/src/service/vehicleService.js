import http from "./httpService";

const endPoint = "/vehicle";

export async function findAllVehicles() {
  return await http.get(endPoint + "/findAll");
}
export async function saveVehicle(vehicle) {
  return await http.post(endPoint, vehicle);
}

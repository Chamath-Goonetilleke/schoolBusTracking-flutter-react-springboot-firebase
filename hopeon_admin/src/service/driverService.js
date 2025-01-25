import http from "./httpService";

const endPoint = "/driver";

export async function findAllDrivers() {
  return await http.get(endPoint + "/findAll");
}
export async function saveDriver(driver) {
  return await http.post(endPoint, driver);
}

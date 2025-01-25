import http from "./httpService";

const endPoint = "/student";

export async function findAllStudents(){
    return await http.get(endPoint + "/findAll");
}
export async function saveStudent(student){
    return await http.post(endPoint ,student);
}
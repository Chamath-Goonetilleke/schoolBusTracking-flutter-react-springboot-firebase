import axios from 'axios';

const baseURL = "http://localhost:8080/api/v1"
axios.defaults.baseURL = baseURL;

const methods ={
    get: axios.get,
    post: axios.post,
    put: axios.put,
    delete: axios.delete
}
export default methods;
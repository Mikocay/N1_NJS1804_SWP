// src/config/axios.ts

import axios from "axios";
import { API_URL } from "..";

// Default axios instance (probably for general use)
export default axios.create({
  baseURL: API_URL,
  headers: {
    "Content-Type": "application/json",
  },
});

// Private axios instance (with credentials)
export const axiosPrivate = axios.create({
  baseURL: API_URL,
  headers: {
    "Content-Type": "application/json",
  },
  withCredentials: true,
});

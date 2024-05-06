import React from "react";
import {BrowserRouter, Routes , Route} from "react-router-dom";
import LindingView from "./Pages/LindingView";
import FlightInfo from "./Pages/FlightInfo";
import BookingFly from "./Pages/BookingFly";
import Login from "./Pages/Login";
export default function AppRouters(props){
    return(
        <BrowserRouter>
        <Routes>
        <Route path="/login" element={<LindingView/>} />

            <Route path="/flightinfo" element={<FlightInfo/>} />
        <Route path="/Book-Flight/:flid" element={<BookingFly/>} />         
            <Route path="/" element={<Login/>} />

        </Routes>

        </BrowserRouter>
    )
}
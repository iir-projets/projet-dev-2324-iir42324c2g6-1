import React from "react";
import {BrowserRouter, Routes , Route} from "react-router-dom";
import LindingView from "./Pages/LindingView";
import FlightInfo from "./Pages/FlightInfo";
import BookingFly from "./Pages/BookingFly";
import Login from "./Pages/Login";
import Register from "./Pages/Register";
export default function AppRouters(props){
    return(
        <BrowserRouter>
        <Routes>

        <Route path="/LindingView" element={<LindingView/>} />

            <Route path="/flightinfo" element={<FlightInfo/>} />
        <Route path="/Book-Flight/:flid" element={<BookingFly/>} />         
            <Route path="/Register" element={<Login/>} />
            <Route path="/" element={<Register/>} />

        </Routes>

        </BrowserRouter>
    )
}
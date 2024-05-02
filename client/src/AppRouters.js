import React from "react";
import {BrowserRouter, Routes , Route} from "react-router-dom";
import LindingView from "./Pages/LindingView";
import FlightInfo from "./Pages/FlightInfo";
import BookingFly from "./Pages/BookingFly";
export default function AppRouters(props){
    return(
        <BrowserRouter>
        <Routes>
            <Route path="/" element={<LindingView/>} />

            <Route path="/flightinfo" element={<FlightInfo/>} />
            <Route path="/Book-Flight/:flid" element={<BookingFly/>} />

        </Routes>

        </BrowserRouter>
    )
}
import Search from "@mui/icons-material/Search";
import { combineReducers } from "redux";
import flightReducer from "./flightReducer";

export default combineReducers({
    Search : flightReducer
})
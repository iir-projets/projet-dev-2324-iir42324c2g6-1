import logo from './logo.svg';
import './App.css';
import Navbar from './component/Navbar';
import LindingView from './Pages/LindingView';
import AppRouters from './AppRouters';

import { BrowserRouter } from "react-router-dom";

function App() {
  return (
    
    <div className='App'> 
      <Navbar/>
      <div className='main-body'>

      <h1>Welcome to YO-Airline</h1>

      <AppRouters/>

      </div>
     

    </div>
    
   
  );
}

export default App;

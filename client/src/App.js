import logo from './logo.svg';
import './App.css';
import Navbar from './component/Navbar';
import LindingView from './Pages/LindingView';
import AppRouters from './AppRouters';

function App() {
  return (
    <div className='App'> 
      <header>
      <div style={{minHeight:"10vh", width:'100%', backgroundColor:"#5BB4FF"}}></div>
      <Navbar/>
      
      
      </header>
      <div className='main-body'>

      <h1>Welcome to YO-Airline</h1>

      <AppRouters/>

      </div>
      <footer>
      <div style={{minHeight:"10vh", width:'100%', backgroundColor:"#5BB4FF"}}></div>
      </footer>

    </div>
  );
}

export default App;

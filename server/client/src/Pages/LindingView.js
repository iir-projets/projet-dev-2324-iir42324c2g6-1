import { Stack } from '@mui/system';
import * as React from 'react';
import Radio from '@mui/material/Radio';
import RadioGroup from '@mui/material/RadioGroup';
import FormControlLabel from '@mui/material/FormControlLabel';
import FormControl from '@mui/material/FormControl';
import { Paper, TextField , Button, Container , Box } from '@mui/material';
import { useDispatch , useSelector } from 'react-redux';
import { searchFlights } from '../component/action/flight-actions';
import { Navigate, useNavigate } from 'react-router-dom';



export default function LindingView(props) {
    const [travelDate , setTravelDate] = React.useState(new Date());
    const [returnDate , setReturnDate] = React.useState(new Date());
    const {searchResults} = useSelector(state => state.search);
    const Navigate = useNavigate();
    const [fromData , setFormData]= React.useState({
        origin: '',
        dest: '',
        date: new Date(),
        returnDate: new Date(),
        numTravellers: ""
    })
    const handleInputChange = event => {
        const { name, value } = event.target;
        
        setFormData(prevData =>({...fromData, [name]: value}  ));
    };
    
    const dispatch = useDispatch();
    const handleSearch = () => {
        const info = {};
        info.origin = fromData.origin;
        info.dest = fromData.dest;
        info.date = fromData.date;
        dispatch(searchFlights(info)).then(resp => {
            console.log("request complet")
        })
    }
    const handleBooking = (FlightInfo) => {
        Navigate(`/Book-Flight/${FlightInfo.flid}`);
    }
    console.log(searchResults);
    const HandleDataDisplay = () => {
        if(!searchResults) {
            return null;
        }
        return (
            searchResults?.responseData.map((flight, index) =>(
                <React.Fragment key={index}>
                <Paper key={index} elevation={3}>
                    <div style={{padding: '10px'}}>
                        <div>Time: {flight.departureTime}</div>
                        <div>Cost : {flight.cost}</div>
                        <div>Aircraft : {flight.aircraft}</div>
                        
                    </div>
                    <div><button onClick={()=> handleBooking(flight)} variant='contained'>BOOK</button></div>
                    <br/>
                </Paper>
                <br/>
                </React.Fragment>
            )
        )  
        )
    }
    return (
        <div>
            <Stack direction="column" justifyContent="center">
                <Container maxWidth='sm'>
                <div>YO Reserve Your flight Now</div>
                <form>
                <Paper elevation={6}>
                    <h3>Find Your Flight Now</h3>
                <div className='View' >
                    <FormControl>
                        
                        <RadioGroup
                            aria-labelledby="demo-radio-buttons-group-label"
                            defaultValue="Rounde Trip"
                            name="radio-buttons-group" >
                        <FormControlLabel value="One Way" control={<Radio />} label="One Way" />
                        <FormControlLabel value="Rounde Trip" control={<Radio />} label="Rounde Trip" />
                        <FormControlLabel value="other" control={<Radio />} label="Other" />
                        </RadioGroup>
                        </FormControl>
                    <div>
                        <TextField
                        label="Form"
                        variant='outlined'
                        name='origin'
                        onChange={handleInputChange}
                        />&nbsp;
                        <TextField
                        label="TO"
                        variant='outlined'
                        name='dest'
                        onChange={handleInputChange}
                        />
                    </div><br/>
                    <div >
                    <Stack direction='row'>
                    
                    <TextField 
                                //onChange={(event) =>  setTravelDate(event.target.value)}  
                                label="Date" 
                                variant="outlined"
                                type ="date"
                                value = {fromData.date}
                                name = "date"
                                onChange={handleInputChange}
                                // helperText = {firstNameError}
                            />
                            &nbsp;

                            <TextField 
                                //onChange={(event) =>  setReturnDate(event.target.value)}  
                                label="Return date" 
                                variant="outlined"
                                type = "date"
                                value = {fromData.returnDate}
                                onChange={handleInputChange}
                                // helperText = {firstNameError}
                                name = "returnDate"
                            />
                            &nbsp;
                            <TextField 
                                // onChange={(event) =>  handleFirstNameChange(event.target.value)}  
                                label="# Travellers" 
                                variant="outlined"
                                onChange={handleInputChange}
                                // helperText = {firstNameError}
                                name = "numTravellers"
                            />
                        </Stack>
                    </div>
                    
                    <br/>
                    
                    <div>
                    <Button onClick={() => handleSearch()} size='large' variant = 'contained' color='success'>Search</Button>
                    </div>
                </div>
                </Paper>
                </form>
                </Container>

                <div>
                <Stack direction="column" justifyContent="center" padding={10}>
                    <Container maxWidth='xl'>

                        {HandleDataDisplay()}

                    </Container>

                </Stack>


                <Stack direction="column" justifyContent="center" >
                    <Container maxWidth='xl'>
                <div>YO Reserve Your flight Now</div>
                <Paper elevation={6}>
                    <h3>Recomendation</h3>
                    <div style={{padding :'10px'}}>

                    <Stack direction="row" justifyContent="center" spacing={3}>
                    <Box
                    sx={{
                    width: 200,
                    height: 200,
                    border: 'solid 2px blue',
                    
                    }}
                    />
                    <Box
                    sx={{
                    width: 200,
                    height: 200,
                    border: 'solid 2px blue',
                    
                    }}
                    />
                    <Box
                    sx={{
                    width: 200,
                    height: 200,
                    border: 'solid 2px blue',
                    
                    }}
                    />
                    <Box
                    sx={{
                    width: 200,
                    height: 200,
                    border: 'solid 2px blue',
                    
                    }}
                    />
                    </Stack>
                </div>
                <br/>


                
                </Paper>
                </Container>
                </Stack>
                </div>


            </Stack>
        </div>
    );
}
import React, { useEffect, useState } from "react";
import {
  Avatar,
  Button,
  Dialog,
  DialogActions,
  DialogContent,
  DialogTitle,
  FormControl,
  FormControlLabel,
  InputLabel,
  MenuItem,
  Select,
  TextField,
} from "@mui/material";
import AddIcon from "@mui/icons-material/Add";
import { styled } from "@mui/material/styles";
import Switch from "@mui/material/Switch";

const IOSSwitch = styled((props) => (
  <Switch focusVisibleClassName=".Mui-focusVisible" disableRipple {...props} />
))(({ theme }) => ({
  width: 42,
  height: 26,
  padding: 0,
  "& .MuiSwitch-switchBase": {
    padding: 0,
    margin: 2,
    transitionDuration: "300ms",
    "&.Mui-checked": {
      transform: "translateX(16px)",
      color: "#fff",
      "& + .MuiSwitch-track": {
        backgroundColor: "#65C466",
        opacity: 1,
        border: 0,
      },
    },
  },
  "& .MuiSwitch-thumb": {
    width: 22,
    height: 22,
  },
  "& .MuiSwitch-track": {
    borderRadius: 13,
    backgroundColor: "#E9E9EA",
    opacity: 1,
    transition: theme.transitions.create(["background-color"], {
      duration: 500,
    }),
  },
}));

export default function AddVehicleModal({ fetchAllVehicles }) {
  const [open, setOpen] = useState(false);

  const [vehicle, setVehicle] = useState({
    vehicleNo: "",
    type: "",
    color: "",
    brand: "",
    model: "",
    seatCount: 0,
    availableSeatCount: 0,
    route: "",
    locations: "",
    active: true,
  });

  const handleClickOpen = () => setOpen(true);
  const handleClose = () => setOpen(false);

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setVehicle({ ...vehicle, [name]: value });
  };

  const handleSwitchChange = (e) => {
    setVehicle({ ...vehicle, active: e.target.checked });
  };

  const handleSave = async () => {
    // Save vehicle logic goes here
    console.log("Vehicle data saved:", vehicle);
    fetchAllVehicles();
    handleClose();
  };

  return (
    <React.Fragment>
      <Button
        startIcon={<AddIcon />}
        variant="outlined"
        onClick={handleClickOpen}
      >
        Add new vehicle
      </Button>
      <Dialog
        open={open}
        onClose={handleClose}
        aria-labelledby="responsive-dialog-title"
      >
        <DialogTitle>{"Add New Vehicle"}</DialogTitle>
        <DialogContent>
          <TextField
            fullWidth
            margin="normal"
            name="vehicleNo"
            label="Vehicle Number"
            variant="outlined"
            value={vehicle.vehicleNo}
            onChange={handleInputChange}
          />
          <TextField
            fullWidth
            margin="normal"
            name="type"
            label="Type"
            variant="outlined"
            value={vehicle.type}
            onChange={handleInputChange}
          />
          <TextField
            fullWidth
            margin="normal"
            name="color"
            label="Color"
            variant="outlined"
            value={vehicle.color}
            onChange={handleInputChange}
          />
          <TextField
            fullWidth
            margin="normal"
            name="brand"
            label="Brand"
            variant="outlined"
            value={vehicle.brand}
            onChange={handleInputChange}
          />
          <TextField
            fullWidth
            margin="normal"
            name="model"
            label="Model"
            variant="outlined"
            value={vehicle.model}
            onChange={handleInputChange}
          />
          <TextField
            fullWidth
            margin="normal"
            name="seatCount"
            label="Seat Count"
            type="number"
            variant="outlined"
            value={vehicle.seatCount}
            onChange={handleInputChange}
          />
          <TextField
            fullWidth
            margin="normal"
            name="availableSeatCount"
            label="Available Seat Count"
            type="number"
            variant="outlined"
            value={vehicle.availableSeatCount}
            onChange={handleInputChange}
          />
          <TextField
            fullWidth
            margin="normal"
            name="route"
            label="Route"
            variant="outlined"
            value={vehicle.route}
            onChange={handleInputChange}
          />
          <TextField
            fullWidth
            margin="normal"
            name="locations"
            label="Locations"
            variant="outlined"
            value={vehicle.locations}
            onChange={handleInputChange}
          />
        </DialogContent>
        <FormControlLabel
          sx={{ ml: "1rem" }}
          control={
            <IOSSwitch
              sx={{ m: 1 }}
              checked={vehicle.active}
              onChange={handleSwitchChange}
            />
          }
          label="Active"
        />
        <DialogActions sx={{ marginRight: "1rem", marginBottom: "1rem" }}>
          <Button variant="contained" onClick={handleClose}>
            Cancel
          </Button>
          <Button variant="contained" color="success" onClick={handleSave}>
            Save
          </Button>
        </DialogActions>
      </Dialog>
    </React.Fragment>
  );
}

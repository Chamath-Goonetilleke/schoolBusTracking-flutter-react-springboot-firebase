import * as React from "react";
import Box from "@mui/material/Box";
import Grid from "@mui/material/Grid2";
import VehicleCard from "../../components/VehicleCard";

const vehicles = [
  {
    vehicleNo: "LN-1234",
    type: "Bus",
    color: "black",
    brand: "Toyota",
    model: "VSX",
    route: "Kesbewa - Colombo",
    imageUrl: "",
  },
  {
    vehicleNo: "LN-1234",
    type: "Bus",
    color: "black",
    brand: "Toyota",
    model: "VSX",
    route: "Kesbewa - Colombo",
    imageUrl: "",
  },
  {
    vehicleNo: "LN-1234",
    type: "Bus",
    color: "black",
    brand: "Toyota",
    model: "VSX",
    route: "Kesbewa - Colombo",
    imageUrl: "",
  },
  {
    vehicleNo: "LN-1234",
    type: "Bus",
    color: "black",
    brand: "Toyota",
    model: "VSX",
    route: "Kesbewa - Colombo",
    imageUrl: "",
  },
];

export default function VehicleGrid({ setIsVehicleSelected, setSelectedVehicle }) {
  return (
    <Box sx={{ flexGrow: 1 }}>
      <Grid
        container
        spacing={{ xs: 2, md: 3 }}
        columns={{ xs: 7, sm: 9, md: 12 }}
      >
        {vehicles.map((vehicle, index) => (
          <Grid key={index} size={{ xs: 3, sm: 4, md: 4 }}>
            <div
              onClick={() => {
                setSelectedVehicle(vehicle);
                setIsVehicleSelected(true);
              }}
            >
              <VehicleCard vehicle={vehicle} />
            </div>
          </Grid>
        ))}
      </Grid>
    </Box>
  );
}

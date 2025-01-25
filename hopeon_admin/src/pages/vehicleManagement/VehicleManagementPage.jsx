import React from "react";
import { Button } from "@mui/material";
import AddIcon from "@mui/icons-material/Add";
import SingleVehiclePage from "./SingleVehiclePage";
import VehicleGrid from "./VehicleGrid";
import AddVehicleModal from "../../components/AddVehicleModal";

export default function VehicleManagementPage() {
    const [isVehicleSelected, setIsVehicleSelected] = React.useState(false);
    const [selectedVehicle, setSelectedVehicle] = React.useState(null);
    if (isVehicleSelected === true) {
      return (
        <SingleVehiclePage
          vehicle={selectedVehicle}
          setIsVehicleSelected={setIsVehicleSelected}
          setSelectedVehicle={setSelectedVehicle}
        />
      );
    } else {
      return (
        <div style={{ margin: "1rem" }}>
          <div
            style={{
              display: "flex",
              justifyContent: "flex-end",
              padding: "1rem",
            }}
          >
           <AddVehicleModal/>
          </div>
          <VehicleGrid setIsVehicleSelected={setIsVehicleSelected} setSelectedVehicle={setSelectedVehicle} />
        </div>
      );
    }
  
}

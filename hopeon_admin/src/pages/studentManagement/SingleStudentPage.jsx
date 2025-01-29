import {
  Avatar,
  Button,
  Divider,
  FormControl,
  IconButton,
  InputLabel,
  MenuItem,
  Select,
  FormControlLabel,
  TextField,
} from "@mui/material";
import React, { useState } from "react";
import ArrowBackIcon from "@mui/icons-material/ArrowBack";
import EditNoteIcon from '@mui/icons-material/EditNote';
import OpenInNewIcon from "@mui/icons-material/OpenInNew";
import { styled } from "@mui/material/styles";
import Switch from "@mui/material/Switch";
import AssignVehicleModel from "../../components/AssignVehicleModel";

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

const grades = [
  { id: 1, grade: "Grade 5", classes: ["A", "B", "C"] },
  { id: 2, grade: "Grade 6", classes: ["A", "B", "C"] },
  { id: 3, grade: "Grade 7", classes: ["A", "B", "C"] },
  { id: 4, grade: "Grade 8", classes: ["A", "B", "C"] },
];

export default function SingleStudentPage({
  selectedStudent,
  setIsStudentSelected,
  setSelectedStudent,
}) {
  const [selectedGrade, setSelectedGrade] = useState(1);
  const [selectedClasses, setSelectedClasses] = useState([]);
  const [student, setStudent] = useState({ ...selectedStudent });

  const handleInputChange = (e) => {
    const { name, value } = e.target;
    setStudent({ ...student, [name]: value });
  };
  const handleSwitchChange = (e) => {
    //setDriver({ ...driver, active: e.target.checked });
  };
  const handleGradeChange = (e) => {
    const selectedGradeId = e.target.value;
    const selectedGrade = grades.find((g) => g.id === selectedGradeId);
    setStudent({ ...student, grade: selectedGradeId, studentClass: "" });
    setSelectedClasses(selectedGrade.classes || []);
  };
  return (
    <div style={{ margin: "2rem" }}>
      <div style={{ display: "flex", alignItems: "center" }}>
        <IconButton
          onClick={() => {
            setIsStudentSelected(false);
            setSelectedStudent(null);
          }}
        >
          <ArrowBackIcon />
        </IconButton>
      </div>
      <div style={{ display: "flex", height: "80vh", marginBottom: "2rem" }}>
        <div
          style={{
            display: "flex",
            flex: 1,
            flexDirection: "column",

            alignItems: "center",
            width: "100%",
          }}
        >
          <div style={{ margin: "1rem" }}>
            <Avatar
              alt="Remy Sharp"
              src="/static/images/avatar/1.jpg"
              style={{ width: 170, height: 170 }}
            />
          </div>
          <div
            style={{
              display: "flex",
              justifyContent: "flex-end",
              width: "90%",
            }}
          >
            <Button variant="contained" startIcon={<EditNoteIcon />}>
              Edit
            </Button>
          </div>
          <div style={{ width: "90%" }}>
            <TextField
              fullWidth
              margin="normal"
              name="regNo"
              label="Registration Number"
              variant="outlined"
              value={student.regNo}
              onChange={handleInputChange}
            />
            <TextField
              fullWidth
              margin="normal"
              name="email"
              type="email"
              label="Email"
              variant="outlined"
              value={student.email}
              onChange={handleInputChange}
            />
            <TextField
              fullWidth
              margin="normal"
              name="fullName"
              label="Full Name"
              variant="outlined"
              value={student.fullName}
              onChange={handleInputChange}
            />
            <div style={{ display: "flex" }}>
              <FormControl sx={{ marginTop: 2, marginRight: 1, width: 300 }}>
                {/* <InputLabel id="grade-label">Grade</InputLabel>
                <Select
                  labelId="grade-label"
                  label="Grade"
                  name="grade"
                  value={student.grade}
                  onChange={handleGradeChange}
                >
                  {grades.map((grade) => (
                    <MenuItem key={grade.id} value={grade.id}>
                      {grade.grade}
                    </MenuItem>
                  ))}
                </Select>
                 */}
                <TextField
                  fullWidth
                  name="grade"
                  label="Grade"
                  variant="outlined"
                  value={student.grade}
                  sx={{ marginRight: 1 }}
                />
              </FormControl>
              <FormControl sx={{ marginTop: 2, width: 300 }}>
                {/* <InputLabel id="class-label">Class</InputLabel>
                <Select
                  labelId="class-label"
                  label="Class"
                  name="studentClass"
                  value={student.studentClass}
                  onChange={handleInputChange}
                >
                  {selectedClasses.map((cls) => (
                    <MenuItem key={cls} value={cls}>
                      {cls}
                    </MenuItem>
                  ))}
                </Select> */}
                <TextField
                  fullWidth
                  label="Class"
                  name="studentClass"
                  value={student.studentClass}
                  variant="outlined"
                  sx={{ marginRight: 1 }}
                />
              </FormControl>
            </div>
            <TextField
              margin="normal"
              fullWidth
              name="parentName"
              label="Parent Name"
              variant="outlined"
              value={student.parentName}
              onChange={handleInputChange}
            />
            <div style={{ display: "flex" }}>
              <TextField
                margin="dense"
                fullWidth
                name="contactNo"
                label="Contact Number"
                variant="outlined"
                value={student.contactNo}
                onChange={handleInputChange}
                sx={{ marginRight: 1 }}
              />
              <FormControl sx={{ marginTop: 1, marginRight: 1, width: 300 }}>
                <InputLabel id="gender-label">Gender</InputLabel>
                <Select
                  labelId="gender-label"
                  label="Gender"
                  name="gender"
                  value={student.gender}
                  onChange={handleInputChange}
                >
                  <MenuItem value="Male">Male</MenuItem>
                  <MenuItem value="Female">Female</MenuItem>
                </Select>
              </FormControl>
              <FormControl sx={{ marginTop: 1, width: 300 }}>
                <InputLabel id="age-label">Age</InputLabel>
                <Select
                  labelId="age-label"
                  label="Age"
                  name="age"
                  value={student.age}
                  onChange={handleInputChange}
                >
                  {Array.from(Array(18)).map((_, index) => (
                    <MenuItem key={index} value={index + 1}>
                      {index + 1}
                    </MenuItem>
                  ))}
                </Select>
              </FormControl>
            </div>
            <TextField
              margin="dense"
              fullWidth
              name="location"
              label="Location"
              variant="outlined"
              value={student.location}
              onChange={handleInputChange}
            />
          </div>
        </div>
        <div
          style={{
            display: "flex",
            flex: 2,
            width: "100%",
            flexDirection: "column",
          }}
        >
          <FormControlLabel
            control={
              <IOSSwitch
                sx={{ m: 1 }}
                checked={student.active}
                onChange={handleSwitchChange}
              />
            }
            label="Active"
          />

          <div style={{ marginBottom: "2rem" }}>
            <div style={{ display: "flex", justifyContent: "space-between" }}>
              <h3>Vehicle Details</h3>
              <Button endIcon={<OpenInNewIcon />}>view details</Button>
            </div>
            {student.vehicleId === null ? (
              <AssignVehicleModel studentId={student.id} />
            ) : (
              <div>
                <div style={{ marginBottom: "1rem" }}>
                  Vehicle No: {student.vehicleNo}
                </div>
                <div>Type, Brand, Model: {student.vehicleDetails}</div>
              </div>
            )}
          </div>
          <Divider style={{ marginBottom: "1rem" }} />
          <div style={{ marginBottom: "3rem" }}>
            <div style={{ display: "flex", justifyContent: "space-between" }}>
              <h3>Driver Details</h3>
              <Button endIcon={<OpenInNewIcon />}>view details</Button>
            </div>
            {student.vehicleId === null && student.driverId === null ? (
              <div>
                <i>No Driver Details</i>
              </div>
            ) : (
              <div>
                <div style={{ marginBottom: "1rem" }}>
                  Driver Name: {student.driverName}
                </div>
                <div>Contact Number: {student.vehicleNo}</div>
              </div>
            )}
          </div>
          <div>
            <Button sx={{ width: "100%" }} variant="outlined">
              Reset Password
            </Button>
          </div>
        </div>
      </div>
    </div>
  );
}

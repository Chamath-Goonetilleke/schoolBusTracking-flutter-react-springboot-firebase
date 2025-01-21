import {
  Avatar,
  Button,
  FormControl,
  IconButton,
  InputLabel,
  MenuItem,
  Select,
  TextField,
} from "@mui/material";
import React, { useState } from "react";
import ArrowBackIcon from "@mui/icons-material/ArrowBack";
import { margin } from "../../../node_modules/@mui/system/esm/spacing/spacing";
import EditNoteIcon from '@mui/icons-material/EditNote';
const grades = [
  { id: 1, grade: "Grade 5", classes: ["A", "B", "C"] },
  { id: 2, grade: "Grade 6", classes: ["A", "B", "C"] },
  { id: 3, grade: "Grade 7", classes: ["A", "B", "C"] },
  { id: 4, grade: "Grade 8", classes: ["A", "B", "C"] },
];

export default function SingleStudentPage({
  student,
  setIsStudentSelected,
  setSelectedStudent,
}) {
  const [selectedGrade, setSelectedGrade] = useState(1);
  const [selectedClasses, setSelectedClasses] = useState([]);

  const onSelectGrade = (e) => {
    setSelectedGrade(e.target.value);
    const selectedGrade = grades.filter(g=> g.id === e.target.value)[0];
    setSelectedClasses(selectedGrade.classes)
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
      <div style={{ display: "flex", height: "80vh" }}>
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
          <div style={{display:'flex', justifyContent:'flex-end', width:'90%', }} >
            <Button variant="contained" startIcon={<EditNoteIcon/>} >Edit</Button>
          </div>
          <div style={{ width: "90%" }}>
            <TextField
              fullWidth
              margin="normal"
              label="Registration Number"
              variant="outlined"
            />
            <TextField fullWidth label="Full Name" variant="outlined" />
            <div style={{ display: "flex" }}>
              <FormControl sx={{ marginTop: 2, marginRight: 1, width: 300 }}>
                <InputLabel id="demo-multiple-name-label">Grade</InputLabel>
                <Select
                  labelId="demo-multiple-name-label"
                  label="Grade"
                  value={selectedGrade}
                  onChange={onSelectGrade}
                >
                  {grades.map((grade) => (
                    <MenuItem key={grade.id} value={grade.id}>
                      {grade.grade}
                    </MenuItem>
                  ))}
                </Select>
              </FormControl>
              <FormControl sx={{ marginTop: 2, width: 300 }}>
                <InputLabel id="demo-multiple-name-label">Class</InputLabel>
                <Select labelId="demo-multiple-name-label" label="class">
                  {selectedClasses.map((cls) => (
                    <MenuItem key={cls} value={cls}>
                      {cls}
                    </MenuItem>
                  ))}
                </Select>
              </FormControl>
            </div>
            <TextField
              margin="dense"
              fullWidth
              label="Parent Name"
              variant="outlined"
            />
            <div style={{ display: "flex" }}>
              <TextField
                margin="dense"
                fullWidth
                label="Contact Number"
                variant="outlined"
                sx={{ marginRight: 1 }}
              />
              <FormControl sx={{ marginTop: 1, marginRight: 1, width: 300 }}>
                <InputLabel id="demo-multiple-name-label">Gender</InputLabel>
                <Select labelId="demo-multiple-name-label" label="Gender">
                  <MenuItem key="Male" value="Male">
                    Male
                  </MenuItem>
                  <MenuItem key="Female" value="Female">
                    Female
                  </MenuItem>
                </Select>
              </FormControl>
              <FormControl sx={{ marginTop: 1, width: 300 }}>
                <InputLabel id="demo-multiple-name-label">Age</InputLabel>
                <Select labelId="demo-multiple-name-label" label="Age">
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
              label="Location"
              variant="outlined"
            />
          </div>
        </div>
        <div
          style={{
            display: "flex",
            flex: 2,
            width: "100%",
           
          }}
        ></div>
      </div>
    </div>
  );
}

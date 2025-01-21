import * as React from "react";
import Box from "@mui/material/Box";
import Grid from "@mui/material/Grid2";
import StudentCard from "../../components/StudentCard";

const students = [
  {
    regNo: "123456",
    fullName: "Chamath Goonetilleke",
    grade: "Grade 5",
    class: "E",
    parentName:"Sunil",
    contactNo:"0788564256",
    gender:"Male",
    age:"15",
    location:"Kesbewa Junction",
    imageUrl:""
  },
  {
    regNo: "123456",
    fullName: "Chamath Goonetilleke",
    grade: "Grade 5",
    class: "E",
    parentName:"Sunil",
    contactNo:"0788564256",
    gender:"Male",
    age:"15",
    location:"Kesbewa Junction",
    imageUrl:""
  },
  {
    regNo: "123456",
    fullName: "Chamath Goonetilleke",
    grade: "Grade 5",
    class: "E",
    parentName:"Sunil",
    contactNo:"0788564256",
    gender:"Male",
    age:"15",
    location:"Kesbewa Junction",
    imageUrl:""
  },
  {
    regNo: "123456",
    fullName: "Chamath Goonetilleke",
    grade: "Grade 5",
    class: "E",
    parentName:"Sunil",
    contactNo:"0788564256",
    gender:"Male",
    age:"15",
    location:"Kesbewa Junction",
    imageUrl:""
  },
];

export default function StudentGrid({
  setIsStudentSelected,
  setSelectedStudent,
}) {
  return (
    <Box sx={{ flexGrow: 1 }}>
      <Grid
        container
        spacing={{ xs: 2, md: 3 }}
        columns={{ xs: 7, sm: 9, md: 12 }}
      >
        {students.map((student, index) => (
          <Grid key={index} size={{ xs: 3, sm: 4, md: 4 }}>
            <div
              onClick={() => {
                setSelectedStudent(student);
                setIsStudentSelected(true);
              }}
            >
              <StudentCard student={student} />
            </div>
          </Grid>
        ))}
      </Grid>
    </Box>
  );
}

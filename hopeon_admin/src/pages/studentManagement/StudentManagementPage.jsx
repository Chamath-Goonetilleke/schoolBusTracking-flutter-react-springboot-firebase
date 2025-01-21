import React from "react";
import StudentGrid from "./StudentGrid";
import { styled, alpha } from "@mui/material/styles";
import InputBase from "@mui/material/InputBase";
import SearchIcon from "@mui/icons-material/Search";
import { Button } from "@mui/material";
import AddIcon from "@mui/icons-material/Add";
import SingleStudentPage from "./SingleStudentPage";

const Search = styled("div")(({ theme }) => ({
  position: "relative",
  borderRadius: theme.shape.borderRadius,
  backgroundColor: alpha(theme.palette.common.white, 0.15),
  "&:hover": {
    backgroundColor: alpha(theme.palette.common.white, 0.25),
  },
  marginLeft: 0,
  width: "100%",
  [theme.breakpoints.up("sm")]: {
    marginLeft: theme.spacing(1),
    width: "auto",
  },
}));

const SearchIconWrapper = styled("div")(({ theme }) => ({
  padding: theme.spacing(0, 2),
  height: "100%",
  position: "absolute",
  pointerEvents: "none",
  display: "flex",
  alignItems: "center",
  justifyContent: "center",
}));

const StyledInputBase = styled(InputBase)(({ theme }) => ({
  color: "inherit",
  width: "100%",
  "& .MuiInputBase-input": {
    padding: theme.spacing(1, 1, 1, 0),
    // vertical padding + font size from searchIcon
    paddingLeft: `calc(1em + ${theme.spacing(4)})`,
    transition: theme.transitions.create("width"),
    [theme.breakpoints.up("sm")]: {
      width: "12ch",
      "&:focus": {
        width: "20ch",
      },
    },
  },
}));

export default function StudentManagementPage() {
    const [isStudentSelected, setIsStudentSelected] = React.useState(false);
    const [selectedStudent, setSelectedStudent] = React.useState(null);
    if (isStudentSelected === true) {
      return (
        <SingleStudentPage
          student={selectedStudent}
          setIsStudentSelected={setIsStudentSelected}
          setSelectedStudent={setSelectedStudent}
        />
      );
    } else {
      return (
        <div style={{ margin: "1rem" }}>
          <div
            style={{
              display: "flex",
              justifyContent: "space-between",
              padding: "1rem",
            }}
          >
            <Search>
              <SearchIconWrapper>
                <SearchIcon />
              </SearchIconWrapper>
              <StyledInputBase
                placeholder="Search…"
                inputProps={{ "aria-label": "search" }}
              />
            </Search>
            <Button variant="outlined" startIcon={<AddIcon />}>
              Add New Student
            </Button>
          </div>
          <StudentGrid setIsStudentSelected={setIsStudentSelected} setSelectedStudent={setSelectedStudent} />
        </div>
      );
    }
  
}

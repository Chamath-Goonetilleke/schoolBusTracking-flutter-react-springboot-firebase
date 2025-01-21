import * as React from "react";
import Table from "@mui/material/Table";
import TableBody from "@mui/material/TableBody";
import TableCell from "@mui/material/TableCell";
import TableContainer from "@mui/material/TableContainer";
import TableHead from "@mui/material/TableHead";
import TableRow from "@mui/material/TableRow";
import Paper from "@mui/material/Paper";
import { IconButton } from "@mui/material";
import DeleteIcon from "@mui/icons-material/Delete";
import EditGradeModal from "./EditGradeModal";
import DeleteModal from "./common/DeleteModal";

const rows = [
  { id: 1, grade: "Snow", classes: "Jon" },
  { id: 2, grade: "Lannister", classes: "Cersei" },
  {
    id: 3,
    grade: "Lannister",
    classes: "Jaime",
  },
  { id: 4, grade: "Stark", classes: "Arya" },
  { id: 5, grade: "Targaryen", classes: "Daenerys" },
  { id: 6, grade: "Melisandre", classes: null },
  { id: 7, grade: "Clifford", classes: "Ferrara" },
  { id: 8, grade: "Frances", classes: "Rossini" },
  { id: 9, grade: "Roxie", classes: "Harvey" },
];

export default function GradesAndClassesTable() {
  const deleteButton = (func) => {
    return (
      <IconButton onClick={() => func()}>
        <DeleteIcon />
      </IconButton>
    );
  };

  return (
    <TableContainer component={Paper}>
      <Table sx={{ minWidth: 650 }} aria-label="simple table">
        <TableHead>
          <TableRow>
            <TableCell>Grade</TableCell>
            <TableCell align="left">Classes</TableCell>
            <TableCell align="center">Action</TableCell>
          </TableRow>
        </TableHead>
        <TableBody>
          {rows.map((row) => (
            <TableRow key={row.grade}>
              <TableCell width={200}>{row.grade}</TableCell>
              <TableCell width={700} align="left">
                {row.classes}
              </TableCell>
              <TableCell align="center">
                <div>
                  <EditGradeModal />
                  <DeleteModal
                    text={"Are you sure, you want to delete this?"}
                    button={deleteButton}
                    func={() => {}}
                  />
                </div>
              </TableCell>
            </TableRow>
          ))}
        </TableBody>
      </Table>
    </TableContainer>
  );
}

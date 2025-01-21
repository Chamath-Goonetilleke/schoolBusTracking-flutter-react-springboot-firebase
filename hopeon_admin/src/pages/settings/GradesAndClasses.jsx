import React from "react";
import GradesAndClassesTable from "../../components/GradesAndClassesTable";
import AddGradeModal from "../../components/AddGradeModal";
export default function GradesAndClasses() {
  return (
    <div>
      <div
        style={{
          display: "flex",
          justifyContent: "flex-end",
          marginBottom: "1rem",
        }}
      >
        <AddGradeModal />
      </div>
      <GradesAndClassesTable />
    </div>
  );
}

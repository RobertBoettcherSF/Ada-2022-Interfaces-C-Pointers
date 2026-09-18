pragma Ada_2022;
with Ada.Assertions; use Ada.Assertions;
with Ada.Text_IO; use Ada.Text_IO;
with Interfaces_C_Pointers_Demo;
procedure Tests is
begin
   Assert (Interfaces_C_Pointers_Demo.Value_Terminated);
   Assert (Interfaces_C_Pointers_Demo.Virtual_Length_Ok);
   Put_Line ("PASS Interfaces.C.Pointers Value / Virtual_Length");
   Put_Line ("All Interfaces.C.Pointers topic tests passed.");
end Tests;

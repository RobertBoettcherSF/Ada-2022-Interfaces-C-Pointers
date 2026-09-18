pragma Ada_2022;
with Interfaces.C;
with Interfaces.C.Pointers;
package body Interfaces_C_Pointers_Demo is
   package C renames Interfaces.C;
   use type C.ptrdiff_t;
   use type C.char;
   type Char_Array is array (C.size_t range <>) of aliased C.char;
   package Char_Ptrs is new Interfaces.C.Pointers
     (Index              => C.size_t,
      Element            => C.char,
      Element_Array      => Char_Array,
      Default_Terminator => C.nul);
   Buf : aliased Char_Array :=
     [0 => C.To_C ('A'), 1 => C.To_C ('B'), 2 => C.To_C ('C'), 3 => C.nul];
   function Value_Terminated return Boolean is
      P : constant Char_Ptrs.Pointer := Buf (0)'Access;
      V : constant Char_Array := Char_Ptrs.Value (P);
   begin
      return V'Length = 4
        and then C.To_Ada (V (0)) = 'A'
        and then C.To_Ada (V (2)) = 'C'
        and then V (3) = C.nul;
   end Value_Terminated;
   function Virtual_Length_Ok return Boolean is
      P : constant Char_Ptrs.Pointer := Buf (0)'Access;
   begin
      return Char_Ptrs.Virtual_Length (P) = 3;
   end Virtual_Length_Ok;
end Interfaces_C_Pointers_Demo;

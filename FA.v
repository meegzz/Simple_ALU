module FA (a, b, ci, S_D,Co_Bo);
input a, b, ci;
output S_D, Co_Bo;
wire ab , aci, bci ;

xor (S_D, a, b, ci);
and (ab , a, b);
and (bci , ci, b);
and (aci, a, ci);
or (Co_Bo, ab, aci, bci);

endmodule
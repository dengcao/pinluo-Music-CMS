<%
RTmpBody="xxpxxpxxpxxp"
RStr1="xp"
RBstr=InstrRev(RTmpBody,RStr1,10,0)
RBstr2=Instr(2,RTmpBody,RStr1)
RESPONSE.Write(RBstr)
RESPONSE.Write(RBstr2)
%>
--Server Trigger For logon

CREATE TRIGGER BRUTE_FORCE_LOGON_CONTROL
ON ALL SERVER
FOR LOGON
AS
BEGIN

	DECLARE @COUNT AS INT
	SELECT  @COUNT=COUNT(*) FROM AUDIT.DBO.BRUTE_FORCE_ATTACK 
	WHERE COMPUTERIP=CONNECTIONPROPERTY('client_net_address')
	IF ISNULL(@COUNT,0)>0
	BEGIN
		ROLLBACK
	END

END









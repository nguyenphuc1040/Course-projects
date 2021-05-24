CREATE SEQUENCE Lobby_Stt
   MINVALUE 1 
   MAXVALUE 9999999 
   INCREMENT BY 1 
   START WITH 1
   NOCACHE 
   NOORDER 
   NOCYCLE;
CREATE SEQUENCE Service_Stt
   MINVALUE 1 
   MAXVALUE 9999999 
   INCREMENT BY 1 
   START WITH 1
   NOCACHE 
   NOORDER 
   NOCYCLE;
CREATE SEQUENCE Food_Stt
   MINVALUE 1 
   MAXVALUE 9999999 
   INCREMENT BY 1 
   START WITH 1
   NOCACHE 
   NOORDER 
   NOCYCLE;
CREATE SEQUENCE List_Wedding_Stt
   MINVALUE 1 
   MAXVALUE 9999999 
   INCREMENT BY 1 
   START WITH 1
   NOCACHE 
   NOORDER 
   NOCYCLE;
CREATE SEQUENCE Bill_Stt
   MINVALUE 1 
   MAXVALUE 9999999 
   INCREMENT BY 1 
   START WITH 1
   NOCACHE 
   NOORDER 
   NOCYCLE;
CREATE SEQUENCE Report_Monthly_Stt
   MINVALUE 1 
   MAXVALUE 9999999 
   INCREMENT BY 1 
   START WITH 1
   NOCACHE 
   NOORDER 
   NOCYCLE;
CREATE SEQUENCE Order_Wedding_Stt
   MINVALUE 1 
   MAXVALUE 9999999 
   INCREMENT BY 1 
   START WITH 1
   NOCACHE 
   NOORDER 
   NOCYCLE;
CREATE SEQUENCE Staff_Stt
   MINVALUE 1 
   MAXVALUE 9999999 
   INCREMENT BY 1 
   START WITH 1
   NOCACHE 
   NOORDER 
   NOCYCLE;
CREATE SEQUENCE Account_Stt
   MINVALUE 1 
   MAXVALUE 9999999 
   INCREMENT BY 1 
   START WITH 1
   NOCACHE 
   NOORDER 
   NOCYCLE;
CREATE SEQUENCE Service_Order_Stt
   MINVALUE 1 
   MAXVALUE 9999999 
   INCREMENT BY 1 
   START WITH 1
   NOCACHE 
   NOORDER 
   NOCYCLE;
CREATE SEQUENCE Food_Order_Stt
   MINVALUE 1 
   MAXVALUE 9999999 
   INCREMENT BY 1 
   START WITH 1
   NOCACHE 
   NOORDER 
   NOCYCLE;
CREATE SEQUENCE Customer_Stt
   MINVALUE 1 
   MAXVALUE 9999999 
   INCREMENT BY 1 
   START WITH 1
   NOCACHE 
   NOORDER 
   NOCYCLE;
CREATE SEQUENCE InforWedding_Stt
   MINVALUE 1 
   MAXVALUE 9999999 
   INCREMENT BY 1 
   START WITH 1
   NOCACHE 
   NOORDER 
   NOCYCLE;
/*create table*/
create table Lobby(
    stt number(7) not null,
    idLobby varchar(8),
    nameLobby varchar(30),
    lobbyType varchar(20)check(lobbyType='Vip' or lobbyType='Th??ng' or lobbyType='??c Bi?t'),
    maxTable number(4),
    priceTable number(9),
    priceLobby number(9),
    Active varchar(100),
    constraint Lobby_pk primary key (idLobby)
);
create table Service(
    stt number(7) not null,
    idService varchar2(8),
    nameService varchar2(30),
    price number(9),
    constraint Service_pk primary key (idService)
);
create table Food(
    stt number(7) not null,
    idFood varchar2(8),
    nameFood varchar2(30),
    priceFood number(9),
    typeFood varchar(20) check(typeFood='n??c u?ng' or typeFood='m�n ch�nh' or typeFood = 'khai v?' or typeFood='tr�ng mi?ng'),
    constraint Food_pk primary key (idFood)
);
create table InforWedding(
    stt number(7) not null,
    idWedding varchar(8),
    nameBride varchar(30),
    nameGroom varchar(30),
    constraint InforWedding_pk primary key (idWedding)
);
create table OrderWedding(
    stt number(7) not null,
    idWedding varchar2(8) unique,
    idLobby varchar2(8),
    idStaff varchar2(9),
    idCustomer varchar2(8),
    numberOfFood number(3),
    numberOfService number(3),
    deposit number(12),
    money number(12),
    numberOfTable number(10),
    dateOrderDate date,
    dateStart  date,
    constraint OrderWedding_pk primary key (idWedding,idLobby,idStaff,idCustomer)
);
create table ListWedding(
    stt number(7) not null,
    idWedding varchar2(8),
    status varchar2(7),
    constraint ListWedding_pk primary key (idWedding)
);
create table Staff(
    stt number(7) not null,
    idStaff varchar2(9),
    nameStaff varchar2(30),
    numberPhone varchar2(10) unique,
    address varchar2(50),
    identityCard varchar2(9) unique,
    startWork date,
    typeStaff varchar2(30) check(typeStaff = 'admin' or typeStaff = 'qu?n l�' or typeStaff = 'nh�n vi�n lao c�ng' or typeStaff = 'nh�n vi�n ph?c v?' or typeStaff = 'nh�n vi�n l? t�n'),
    Active varchar(10) check(Active = 'ON' or Active = 'OFF'),
    constraint Staff_pk primary key (idStaff)
);
create table Bill(
    stt number(7) not null,
    idBill varchar2(8),
    idStaff varchar2(9),
    idCustomer varchar2(8),
    idWedding varchar(8),
    money number(10),
    dateOfPayment date,
    constraint Bill_pk primary key (idBill)
);
create table Customer(
    stt number(7) not null,
    idCustomer varchar2(8),
    nameCustomer varchar2(30),
    numberPhone varchar2(10) unique,
    address varchar2(50),
    identityCard varchar2(9) unique,
    birthDay date,
    dayRegister date,
    money number(12),
    discount number(3),
    constraint Customer_pk primary key (idCustomer)
);
create table Account(
    stt number(7) not null,
    idAccount varchar2(10),
    idStaff varchar2(9),
    userName varchar2(20),
    password varchar2(20),
    status varchar(20),
    constraint Account_pk primary key (idAccount)
);
create table Report(
    stt number(7) not null,
    idReport varchar2(9),
    totalBillOfMonth number(12),
    TOTALWEDDINGOFMONTH number(4),
    closingDate date,
    constraint Reports_pk primary key (idReport)
);  
create table ServiceOrder(
    stt number(7) not null,
    idService varchar2(8),
    idWedding varchar2(8),
    constraint ServiceOrder_pk primary key (idService,idWedding)
);

create table FoodOrder(
    stt number(7) not null,
    idFood varchar2(8),
    idWedding varchar2(8),
    constraint FoodOrder_pk primary key (idFood,idWedding)
);
/*create foreign*/
alter table OrderWedding add constraint OrderWedding_Lobby_fk foreign key(idLobby) references Lobby(idLobby);
alter table OrderWedding add constraint OrderWedding_Customer_fk foreign key(idCustomer) references Customer(idCustomer);
alter table OrderWedding add constraint OrderWedding_Staff_fk foreign key(idStaff) references Staff(idStaff);
alter table OrderWedding add constraint OrderWedding_InforWedding_fk foreign key(idWedding) references InforWedding(idWedding);
alter table ListWedding add constraint ListWedding_InforWedding_fk foreign key (idWedding) references InforWedding(idWedding);
alter table Bill add constraint Bill_Staff_fk foreign key (idStaff) references Staff(idStaff);
alter table Bill add constraint Bill_Customer_fk foreign key (idCustomer) references Customer(idCustomer);
alter table ServiceOrder add constraint ServiceOrder_InforWedding_fk foreign key (idWedding) references InforWedding(idWedding);
alter table ServiceOrder add constraint ServiceOrder_Service_fk foreign key (idService) references Service(idService);
alter table FoodOrder add constraint FoodOrder_InforWedding_fk foreign key (idWedding) references InforWedding(idWedding);
alter table FoodOrder add constraint FoodOrder_Service_fk foreign key (idFood) references Food(idFood);
alter table Account add constraint Account_Staff_fk foreign key (idStaff) references Staff(idStaff);
/*create trigger*/
/*trigger Lobby*/
create or replace trigger trg_insertLobby
before insert on Lobby
for each row
declare tmp number(7);
begin
    tmp := Lobby_stt.nextval;
    :new.stt := tmp;
    :new.idLobby := concat('LOB',to_char(tmp));
    :new.active := 'ON';
end;

SET SERVEROUTPUT ON
create or replace trigger trg_insetOrderWedding
before insert on OrderWedding
for each row
declare 
    maxTableTmp number(4);
    priceLobbyTmp number(10);
    priceTableTmp number(10);
    sumService number(12);
    sumFood number(12);
    tmp number(7);
    numberOfFoodTmp number(3);
    numberOfServiceTmp number(3);
    orderLobby number(2);
    activeLobby varchar2(5);
begin
    select count(*) into activeLobby from Lobby where idLobby = :new.idLobby;
    select count(*) into numberOfFoodTmp from FoodOrder where idWedding = :new.idWedding;
    select count(*) into numberOfServiceTmp from ServiceOrder where idWedding = :new.idWedding;
    select maxTable into maxTableTmp from Lobby where idLobby = :new.idLobby;
    select priceLobby into priceLobbyTmp from Lobby where idLobby = :new.idLobby;
    select priceTable into priceTableTmp from Lobby where idLobby = :new.idLobby;
    select Sum(price) into sumService from Service, ServiceOrder where Service.idService = ServiceOrder.idService and ServiceOrder.idWedding = :new.idWedding;
    select Sum(priceFood) into sumFood from Food, FoodOrder where Food.idFood = FoodOrder.idFood and FoodOrder.idWedding = :new.idWedding;
    select count(*) into orderLobby from OrderWedding where :new.idLobby = idLobby and :new.DATESTART = DATESTART;
    if activeLobby = 'false' then
        DBMS_OUTPUT.PUT_LINE('sanh nay da xoa');
        return;
    end if;
    if orderLobby > 0 then
        DBMS_OUTPUT.PUT_LINE('sanh nay da co nguoi dat');
        return;
    else
        if maxTableTmp > :new.numberOfTable then
            tmp := Order_Wedding_stt.nextval;
            :new.stt := tmp;
            :new.numberOfFood := numberOfFoodTmp;
            :new.NUMBEROFSERVICE := numberOfServiceTmp;
            :new.money := priceLobbyTmp+(priceTableTmp+sumFood)*:new.numberOfTable + sumService;
            :new.deposit := :new.money*0.3;
            :new.DATEORDERDATE := current_date;
        else
            DBMS_OUTPUT.PUT_LINE('so luong ban vuot qua gioi han');
            return;
        end if;
    end if;
end;

create or replace trigger trg_insertInforWedding
before insert on InforWedding
for each row
declare tmp number(7);
begin
    tmp := InforWedding_stt.nextval;
    :new.stt := tmp;
    :new.idWedding := concat('WED',to_char(tmp));
end;

create or replace trigger trg_insertStaff
before insert on Staff
for each row
declare tmp number(7);
begin
    tmp := Staff_stt.nextval;
    :new.stt := tmp;
    :new.idStaff := concat('ST',to_char(tmp));
    :new.STARTWORK := current_date;
    :new.ACTIVE := 'ON';
end;

create or replace trigger trg_insertCustomer
before insert on Customer
for each row
declare 
    tmp number(7);
    birthDay number(5);
    dayRegisters number(5);
begin
    tmp := Customer_stt.nextval;
    :new.stt := tmp;
    :new.idCustomer := concat('CUS',to_char(tmp));
    :new.money := 0;
    :new.discount := 0;
    :new.DAYREGISTER := current_date;
end;

create or replace trigger trg_insertAccountAuto
After insert on Staff
for each row
declare tmp number(7);
begin
    tmp := Account_stt.nextval;
    insert into Account values(
        tmp, concat('Acc',tmp) , :new.idStaff, :new.numberPhone, '123456', 'OFF'
    );
end;

create or replace trigger  trg_inserService
before insert on Service
for each row
declare tmp number(7);
begin
    tmp := Service_Stt.nextval;
    :new.stt := tmp;
    :new.idService := concat('SER',to_char(tmp));
end;

create or replace trigger trg_insertFood
before insert on Food
for each row
declare tmp number(7);
begin
    tmp := Food_stt.nextval;
    :new.stt := tmp;
    :new.idFood := concat('F',to_char(tmp));
end;

create or replace trigger trg_insertServiceOrder
before insert on ServiceOrder
for each row
declare 
    tmp number(7);
    serviceTmp number(1);
begin
    select count(*) into serviceTmp from Service where idService = :new.idService and active = 'OFF';
    if serviceTmp = 0 then 
        tmp := Service_Order_stt.nextval;
        :new.stt := tmp;
    end if;
end;

create or replace trigger trg_insertFoodOrder
before insert on FoodOrder
for each row
declare 
    tmp number(7);
    FoodTmp number(1);
begin
    select count(*) into FoodTmp from Food where idFood = :new.idFood and active = 'OFF';
    if FoodTmp = 0 then
        tmp := Food_Order_stt.nextval;
        :new.stt := tmp;
    end if;
end;


create or replace trigger trg_insertListWedding
before insert on ListWedding
for each row
declare tmp number(7);
begin
    tmp := List_Wedding_STT.nextval;
    :new.stt := tmp;
    :new.status := 'ON';
end;

create or replace trigger trg_insertBill
before insert on Bill
for each row
declare 
    tmp number(7);
    priceLobbyTmp number(14);
    priceTableTmp number(14);
    sumService number(14);
    sumFood number(14);
    numberOfTableTmp number(3);
begin
    select priceLobby into priceLobbyTmp from Lobby L, OrderWedding O where L.idLobby = O.idLobby and O.idWedding = :new.idWedding;
    select priceTable into priceTableTmp from Lobby L, OrderWedding O where L.idLobby = O.idLobby and O.idWedding = :new.idWedding;
    select Sum(price) into sumService from Service, ServiceOrder where Service.idService = ServiceOrder.idService and ServiceOrder.idWedding = :new.idWedding;
    select Sum(priceFood) into sumFood from Food, FoodOrder where Food.idFood = FoodOrder.idFood and FoodOrder.idWedding = :new.idWedding;
    select numberOfTable into numberOfTableTmp from OrderWedding where idWedding = :new.idWedding;
    tmp := Bill_stt.nextval;
    :new.stt := tmp;
    :new.idBill := concat('B',tmp);
    :new.money := priceLobbyTmp + numberOfTableTmp*(sumFood+priceTableTmp) + sumService;
    :new.DATEOFPAYMENT := current_date;
    update Customer set money = money + :new.money where idCustomer = :new.idCustomer;
    update ListWedding set status = 'OFF' where idWedding = :new.idWedding;
end;

create or replace trigger trg_updateCustomer
before update on Customer
for each row
begin
    if :new.money > 100000000 and :new.money < 300000000 then
        :new.discount := 20;
    elsif :new.money > 300000000 then
        :new.discount := 35;
    else
        :new.discount := 0;
    end if;
end;

create or replace trigger trg_insertReports
before insert on Report
for each row
declare
    tmp number(7);
    sumReport number(13);
    monthlyTmp number(2);
    yearTmp number(4);
begin
    tmp := report_monthly_stt.nextval;
    :new.stt := tmp;
    :new.idReport := concat('RE',tmp);
    select SUM(money) into sumReport from Bill 
    where EXTRACT(YEAR FROM dateOfPayment) = EXTRACT(YEAR FROM :new.closingDate) and EXTRACT(MONTH FROM dateOfPayment) = EXTRACT(MONTH FROM :new.closingDate);
    :new.TOTALBILLOFMONTH := sumReport;
end;

create or replace trigger trg_updateBill
before update on Bill
for each row
begin
    if :new.idCustomer != :old.idCustomer then
        update Customer set money = money-:old.money where idCustomer = :old.idCustomer;
        update Customer set money = money+:old.money where idCustomer = :new.idCustomer;
    end if;
end;
/*insert Lobby*/
insert into Lobby (nameLobby,lobbyType,maxTable,priceTable,priceLobby) values(
   'Thi�n ???ng', 'Vip', 40, 1000000, 10000000
);
insert into Lobby (nameLobby,lobbyType,maxTable,priceTable,priceLobby) values(
   'Thi�n ???ng', 'Th??ng', 30, 500000, 5000000
);
insert into Lobby (nameLobby,lobbyType,maxTable,priceTable,priceLobby) values(
   'C? ?i?n', 'Vip', 70, 2000000, 50000000
);
insert into Lobby (nameLobby,lobbyType,maxTable,priceTable,priceLobby) values(
   'C? ?i?n', 'Th??ng', 50, 1500000, 20000000 
);
/*insert Food*/
insert into Food(nameFood,priceFood, typeFood) values(
    'soul', 50000, 'khai v?'
);
insert into Food(nameFood,priceFood,typeFood) values(
    'cua', 400000, 'm�n ch�nh'
);
insert into Food(nameFood,priceFood,typeFood) values(
    's�i g�', 100000, 'm�n ch�nh'
);
insert into Food(nameFood,priceFood,typeFood) values(
    'rau cau', 20000, 'tr�ng mi?ng'
);
/*insert Service*/
insert into Service(nameService,price) values(
    'ca h�t', 5000000
);
insert into Service(nameService,price) values(
    '?o thu?t', 2000000
);
insert into Service(nameService,price) values(
    'nh?c s�ng', 3000000
);
/*insert Staff*/
insert into Staff (nameStaff, numberPhone, address, IDENTITYCARD,TYPESTAFF) values(
    'Tr?n ?�nh Kh�i', '0792545700', 'sadasdas', '3213123', 'admin'
);
insert into Staff (nameStaff, numberPhone, address, IDENTITYCARD,TYPESTAFF) values(
    '?? Thanh V�n', '0792545701', 'sadasas', '1213123', 'qu?n l�'
);
insert into Staff (nameStaff, numberPhone, address, IDENTITYCARD,TYPESTAFF) values(
    'Nguy?n V?n A', '0792545702', 'sadasas', '12131243', 'nh�n vi�n ph?c v?'
);
/*insert cus*/
insert into Customer(nameCustomer) values(
    'None'
);
insert into Customer(nameCustomer,numberPhone,ADDRESS, identityCard,BIRTHDAY) values(
    'Tr?n ?�nh Kh�i', '0792545708', '�dfasdfasdf','2334324' ,'14-FEB-2001'
);
/*insert infor wedding*/
insert into InForWedding(nameBride, nameGroom) values(
    'C', 'D'
);
insert into InForWedding(nameBride, nameGroom) values(
    'GK', 'SD'
);
/*insert service order*/
insert into ServiceOrder(IDSERVICE,IDWEDDING) values(
    'SER1', 'WED1'
);
insert into ServiceOrder(IDSERVICE,IDWEDDING) values(
    'SER2', 'WED1'
);
insert into ServiceOrder(IDSERVICE,IDWEDDING) values(
    'SER1', 'WED2'
);
insert into ServiceOrder(IDSERVICE,IDWEDDING) values(
    'SER3', 'WED2'
);
/*insert Food Order*/
insert into FoodOrder(IDFOOD,IDWEDDING) values(
    'F1', 'WED1'
);
insert into FoodOrder(IDFOOD,IDWEDDING) values(
    'F2', 'WED1'
);
insert into FoodOrder(IDFOOD,IDWEDDING) values(
    'F3', 'WED2'
);
insert into FoodOrder(IDFOOD,IDWEDDING) values(
    'F1', 'WED2'
);
insert into FoodOrder(IDFOOD,IDWEDDING) values(
    'F3', 'WED1'
);
/*insert OrderWedding*/
insert into OrderWedding(IDWEDDING,IDLOBBY,IDSTAFF,IDCUSTOMER,NUMBEROFTABLE,DATESTART) values(
    'WED1', 'LOB1', 'ST1', 'CUS1', 20,'16-FEB-2001'
);
insert into OrderWedding(IDWEDDING,IDLOBBY,IDSTAFF,IDCUSTOMER,NUMBEROFTABLE,DATESTART) values(
    'WED2', 'LOB3', 'ST1', 'CUS1', 10,'16-FEB-2001'
);
/*insert ListWedding*/
insert into ListWedding(idWedding) values(
    'WED1'
);
insert into ListWedding(idWedding) values(
    'WED2'
);
update ListWedding set status = 'OFF' where idWedding = 'WED1';
/*insert bill*/
insert into Bill(IDSTAFF,IDCUSTOMER,IDWEDDING) values(
    'ST1','CUS1','WED1'
);
insert into Bill(IDSTAFF,IDCUSTOMER,IDWEDDING) values(
    'ST1','CUS1','WED2'
);
/*insert report*/

insert into report(CLOSINGDATE) values(
    '28-MAY-2021'
);
/*create produce*/
create or replace procedure sp_findStaffByPhone 
(v_numberPhone in staff.numberPhone%type, v_typeStaff out staff.typestaff%type) 
is 
begin
    select typestaff into v_typeStaff
    from staff
    where v_numberphone = numberphone;
    EXCEPTION
    when no_data_found 
    then v_typeStaff := '';
end;

create or replace procedure sp_getAllStaff(cur_userOut OUT SYS_REFCURSOR)
is
begin
    open cur_userOut for
    select  *
    from staff;
end;

create or replace procedure sp_Login (
    v_username in  account.username%type, 
    v_password in account.password%type,
    v_typestaff out staff.TYPESTAFF%type,
    v_idStaff out staff.idstaff%type
)
is
begin
    select staff.typestaff,  staff.idstaff  into v_typestaff, v_idStaff 
    from staff, account
    where staff.idstaff = account.idstaff and v_username=account.username and v_password = account.password;
    EXCEPTION
        WHEN NO_DATA_FOUND THEN
        v_typestaff := '' ;
        v_idStaff :='';
end;
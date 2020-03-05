program Menu_PIlihan;
{I.S : User Memasukan }
{F.S : }
uses crt;
var
 Pilih, PilihKurs, Lama, Kode, Rupiah, Dollar, Kurs, K, M, N : integer;

 Procedure MenuPilihan(var Pilih: integer);
 {I.S : User Memasukkan Nilai Pilih }
 {F.S : Mengeluarkan Nilai Pilih untuk Digunakan Program Utama}
 begin
 textcolor(white);
 gotoxy(54,5);write('Menu Pilihan');
 gotoxy(54,6);write('============');
 gotoxy(46,8);write('1. Hitung Biaya Pembicaraan');
 gotoxy(46,9);write('2. Konversi Mata Uang');
 gotoxy(46,10);write('3. Nilai Deret');
 gotoxy(46,11);write('0. Keluar');
 gotoxy(46,13);write('Pilihan Anda ? ');readln(Pilih);

 { Validasi}
 while(pilih < 0) or (pilih > 3) do
   begin
     textcolor(yellow);
     gotoxy(46,15);write('Hanya Tersedia 0 - 3 !!');
     gotoxy(46,16);write('Tekan Enter untuk Memasukkan Kembali');readln;
     {Bersihin Layar}
     gotoxy(46,15);clreol;
     gotoxy(46,16);clreol;
     textcolor(white);
     {Re Input}
     gotoxy(61,13);clreol; readln(Pilih);
   end; { End While }
 end; { End Procedure MenuPilihan }

 Procedure LamaPembicaraan(var Lama,Kode :integer );
 var
    jj1,jj2,mm1,mm2,dd1,dd2,jj3,mm3,dd3 : integer;
 begin
  clrscr;
  gotoxy(38,4);write('MEMASUKKAN LAMA PEMBICARAAN DAN KODE WILAYAH');
  gotoxy(38,5);write('============================================');
  gotoxy(38,7);write('=== MASUKAN WAKTU AWAL =====================');
  gotoxy(38,9);write ('Jam Awal     : ');readln(jj1);
  gotoxy(38,10);write('Menit Awal   : ');readln(mm1);
  gotoxy(38,11);write('Detik Awal   : ');readln(dd1);
  while (((jj1 < 0) or (jj1 > 24)) or ((mm1<0) or (mm1 > 60))) or ((dd1<0) or (dd1> 60)) do
   begin
        if (jj1 < 0) or (jj1 > 24) then
           begin
             gotoxy(53,9);clreol;readln(jj1);
           end
        else if (mm1<0) or (mm1 > 60) then
           begin
             gotoxy(53,10);clreol;readln(mm1);
           end
        else if (dd1<0) or (dd1> 60) then
           begin
             gotoxy(53,11);clreol;readln(dd1);
           end;
   end;
  gotoxy(38,13);write('=== MASUKAN WAKTU AKHIR ====================');
  gotoxy(38,15);write('Jam Akhir    : ');readln(jj2);
  gotoxy(38,16);write('Menit Akhir  : ');readln(mm2);
  gotoxy(38,17);write('Detik Akhir  : ');readln(dd2);
  while (((jj2 < 0) or (jj2 > 24)) or ((mm2<0) or (mm2 > 60))) or ((dd2<0) or (dd2> 60)) do
   begin
        if (jj2 < 0) or (jj2 > 24) then
           begin
             gotoxy(53,15);clreol;readln(jj2);
           end
        else if (mm2<0) or (mm2 > 60) then
           begin
             gotoxy(53,16);clreol;readln(mm2);
           end
        else if (dd2<0) or (dd2> 60) then
           begin
             gotoxy(53,17);clreol;readln(dd2);
           end;
   end;


  gotoxy(38,19);write('=== MASUKAN KODE WILAYAH ===================');
  gotoxy(38,21);write('Kode Wilayah : ');readln(kode);
  while (kode < 0) or (kode > 3) do
        begin
             gotoxy(53,21);clreol;
             gotoxy(50,23);write('Hanya Tersedia 1 - 3');
             gotoxy(53,21);readln(kode);
             gotoxy(50,23);clreol;
        end;
  { Validasi nn2 > nn1 }
  if (dd2 < dd1) then
     begin
      dd2 := dd2 + 60;
      mm2 := mm2 - 1;
     end;
  if (mm2 < mm1) then
    begin
     mm2 := mm2 + 60;
     jj2 := jj2 - 1;
    end;
  if(jj2 < jj1) then
    begin
     jj2 := jj2 + 24
    end;
   { Proses Hitung }
  jj3 := jj2 - jj1;
  mm3 := mm2 - mm1;
  dd3 := dd2 - dd1;
  Lama := (jj3*3600) + (mm3*60) + dd3;
 end; { End Procedure }

 Function HitungBiaya(Lama,Kode : integer) : integer;
 var
  harga : integer;
 begin
  {Menentukan Harga}
  if(Kode = 1) then
    harga := 100
  else if(Kode = 2) then
    harga := 200
  else if(Kode = 3) then
    harga := 300;

  HitungBiaya := lama * harga;
 end; { End Function }

 Procedure TampilBiaya(Lama,Kode : integer);
 begin
  clrscr;
  gotoxy(47,5);write('Total Lama Pembicaraan : ',lama);
  gotoxy(47,6);write('Kode Wilayah : ',kode);
  gotoxy(47,7);write('Harga Total Rp. ',HitungBiaya(Lama,Kode));
  readln;
 end; { End Procedure }

 { == KONVERSI MATA UANG == }

 Procedure MenuKurs(var PilihKurs : integer);
 begin
  textcolor(white);
 gotoxy(53,5);write('Pilih Konversi');
 gotoxy(53,6);write('==============');
 gotoxy(46,8);write('1. Rupiah ke Dollar');
 gotoxy(46,9);write('2. Dollar ke Rupiah');
 gotoxy(46,10);write('0. Kembali');
 gotoxy(46,12);write('Pilihan Anda ? ');readln(PilihKurs);

 { Validasi}
 while(pilihKurs < 0) or (pilihKurs > 2) do
   begin
     textcolor(yellow);
     gotoxy(46,15);write('Hanya Tersedia 0 - 2 !!');
     gotoxy(46,16);write('Tekan Enter untuk Memasukkan Kembali');readln;
     {Bersihin Layar}
     gotoxy(46,15);clreol;
     gotoxy(46,16);clreol;
     textcolor(white);
     {Re Input}
     gotoxy(61,12);clreol; readln(PilihKurs);
   end; { End While }
 
 end; { End Procedure }

 Procedure IsiRupiah(var Rupiah,Kurs : integer);
 begin
 clrscr;
 gotoxy(44,4);write('MASUKAN JUMLAH UANG & NILAI KURS');
 gotoxy(44,5);write('================================');
 gotoxy(44,7);write('Jumlah Rupiah : ');readln(Rupiah);
 gotoxy(44,8);write('Nilai Kurs    : ');readln(Kurs);

 { Validasi Nilai }
 while(Rupiah < 0) or (Kurs < 0) do
  begin
   textcolor(yellow);
   gotoxy(50,10);write('Tidak Boleh Negatif!');
   textcolor(white);
   if (Rupiah < 0) then
     begin
       gotoxy(58,7);clreol;readln(Rupiah);
     end
   else if (Kurs < 0) then
     begin
       gotoxy(58,8);clreol;readln(Kurs);
     end;
  end;

 gotoxy(44,7);clreol;gotoxy(44,8);clreol;
 gotoxy(44,7);write('Jumlah Uang : Rp.',Rupiah);
 gotoxy(44,8);write('Nilai Kurs  : Rp.',Kurs,' / $1');
 textcolor(yellow);gotoxy(44,10);write('Tekan Enter Untuk Melanjutkan!');textcolor(white);
 readln;
 end; { End Procedure }

 Function HitungDollar(Rupiah,Kurs : integer) : integer;
 {I.S. : Menerima Masukkan Rupiah & Kurs }
 {F.S. : Mengeluarkan Hasil Konversi Rupiah Ke Dollar}
 begin
  HitungDollar := Rupiah div Kurs;
 end; { End Function }

 Function SisaDollar(Rupiah, Kurs : integer) : integer;
 {I.S. : Menerima Masukkan Rupiah & Kurs }
 {F.S. : Mengeluarkan Sisa Konversi Rupiah Ke Dollar}
 begin
   SisaDollar := Rupiah mod Kurs;
 end;{ End Functon }

 Procedure TampilDollar(Rupiah,Kurs: integer);
 {I.S. : Menerima Masukkan Hasil Konversi Rupiah Ke Dollar }
 {F.S. : Menampilkan Hasil Konversi ke Layar User }
 begin
 clrscr;
 gotoxy(52,4);write('HASIL KONVERSI UANG');
 gotoxy(52,5);write('===================');
 gotoxy(44,7); write('Hasil Konversi : $',HitungDollar(Rupiah,Kurs));
 gotoxy(44,8); write('Sisa Konversi  : $',SisaDollar(Rupiah,Kurs));
 readln;
 end; { End Procedure }



 Procedure IsiDollar(var Dollar,Kurs : integer);
 begin
   clrscr;
   gotoxy(44,4);write('MASUKAN JUMLAH UANG & NILAI KURS');
   gotoxy(44,5);write('================================');
   gotoxy(44,7);write('Jumlah Dollar : ');readln(Dollar);
   gotoxy(44,8);write('Nilai Kurs    : ');readln(Kurs);

   { Validasi Nilai }
   while(Rupiah < 0) or (Kurs < 0) do
    begin
     textcolor(yellow);
     gotoxy(50,10);write('Tidak Boleh Negatif!');
     textcolor(white);
     if (Rupiah < 0) then
       begin
         gotoxy(58,7);clreol;readln(Dollar);
       end
     else if (Kurs < 0) then
       begin
         gotoxy(58,8);clreol;readln(Kurs);
       end;
   end;

 gotoxy(44,7);clreol;gotoxy(44,8);clreol;
 gotoxy(44,7);write('Jumlah Uang : $',Dollar);
 gotoxy(44,8);write('Nilai Kurs  : Rp.',Kurs,' / $1');
 textcolor(yellow);gotoxy(44,10);write('Tekan Enter Untuk Melanjutkan!');textcolor(white);
 readln;
 end; { End Procedure }

 Function HitungRupiah(Dollar,Kurs : integer) : integer;
 begin
   HitungRupiah := Dollar * Kurs;
 end; { End Function }

 Procedure TampilRupiah(Dollar,Kurs : integer);
 begin
   clrscr;
   gotoxy(52,4);write('HASIL KONVERSI UANG');
   gotoxy(52,5);write('===================');
   gotoxy(49,7);write('Hasil Konversi : Rp.',HitungRupiah(Dollar,Kurs));
   readln;
 end; { End Procedure }

 Procedure IsiData(var K,M,N: integer);
 begin
   clrscr;
   gotoxy(53,5);write('MASUKKAN NILAI');
   gotoxy(53,6);write('=============');
   gotoxy(50,8);write('Masukkan Nilai K  : ');readln(k);
   gotoxy(50,9);write('Masukkan Nilai M  : ');readln(m);
   gotoxy(50,10);write('Masukkan Nilai N  : ');readln(n);
 end;{ End Procedure }

 Procedure TampilAngka(K,M,N :integer);
 var
    I : integer;
    x : integer;
 begin
   x := 49;
   clrscr;
   gotoxy(51,5);write('HASIL TAMPIL ANGKA');
   gotoxy(51,6);write('==================');

   for I:=1 to N do
    begin
     gotoxy(x,8);
     write(K,', ');
     K:= K + M;
     x := x+3;
    end;
   gotoxy(51,10);write('TEKAN ENTER UNTUK KELUAR');readln;
 end;

 {Procedure TampilAngka(K,M,N : integer);
 begin
 end;}


begin
 Repeat
   clrscr;
   MenuPilihan(Pilih);
     case Pilih of
          1 : begin
                LamaPembicaraan(Lama,Kode);
                clrscr;
                TampilBiaya(Lama,Kode);
              end;
          2 : begin
                clrscr;
                MenuKurs(PilihKurs);
                   case PilihKurs of
                        1 : begin
                              IsiRupiah(Rupiah,Kurs);
                              TampilDollar(Rupiah,Kurs);
                            end;

                        2 : begin
                              IsiDollar(Dollar,Kurs);
                              TampilRupiah(Dollar,Kurs);
                            end;
                   end;
              end;
          3 : begin
                IsiData(K,M,N);
                TampilAngka(K,M,N);
              end;

     end;{End Case}
 Until(Pilih = 0);
end.

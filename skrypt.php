<?php
$connection = new mysqli("localhost","root","","trips");

if(mysqli_connect_errno())
{
    echo "Wystąpił problem z połączeniem z bazą";
    mysqli_close($connection);
}
else
{   
    $s = mysqli_query($connection, "SELECT id, measure_interval FROM trips;");
    
    $interval = array();
    while($row=mysqli_fetch_array($s))
    {
        $interval[$row['id']]=$row['measure_interval'];
    }
    
    $x1 = mysqli_query($connection, "SELECT id, distance FROM trip_measures WHERE trip_id=1;");
    $x2 = mysqli_query($connection, "SELECT id, distance FROM trip_measures WHERE trip_id=2;");
    $x3 = mysqli_query($connection, "SELECT id, distance FROM trip_measures WHERE trip_id=3;");
    
    //-------------------------------------Pętle wykonawcze---------------------------------------------------------------------
    
    $distance = array();
    while($row=mysqli_fetch_array($x1))
    {
        $distance[$row['id']]=$row['distance'];
    }
    $cnt=count($distance);
    $avg_spd = array();
    $avg_spd[1] = 0;
    for($i=2;$i<=$cnt;$i++)
    {
        $y=$i-1;
        $delta=($distance[$i]-$distance[$y]);
        $wynik=(3600*$delta)/$interval[1];
        if($avg_spd[1]<$wynik)
        {
            $avg_spd[1]=$wynik;
        }
    }
    $distance2 = array();
    while($row=mysqli_fetch_array($x2))
    {
        $distance2[$row['id']]=$row['distance'];
    }
    
    $cnt2=count($distance2);
    $avg_spd[2]=0;
    for($i=12;$i<=$cnt2+10;$i++)
    {
        $y=$i-1;
        $delta=($distance2[$i]-$distance2[$y]);
        $wynik=(3600*$delta)/$interval[2];
        if($avg_spd[2]<$wynik)
        {
            $avg_spd[2]=$wynik;
        }
    }
    $distance3 = array();
    while($row=mysqli_fetch_array($x3))
    {
        $distance3[$row['id']]=$row['distance'];
    }
    $cnt3=count($distance3);

    $avg_spd[3]=0;
    for($i=20;$i<=$cnt3+18;$i++)
    {
        $y=$i-1;
        $delta=($distance3[$i]-$distance3[$y]);
        $wynik=(3600*$delta)/$interval[3];
        if($avg_spd[3]<$wynik)
        {
            $avg_spd[3]=$wynik;
        }
    }
    
    //----------------------------------------------Wyświetlenie-------------------------------------------------------------
    
    echo '<table style="border: 2px solid black;text-align: center;">';
    echo '<tr><td>Trip</td><td>distance</td><td>measure interval</td><td>avg speed</td></tr>';
    $zap = mysqli_query($connection, "SELECT name, measure_interval, distance FROM trips INNER JOIN trip_measures ON trip_measures.id=10 AND trip_measures.trip_id=trips.id OR trip_measures.id=18 AND trip_measures.trip_id=trips.id OR trip_measures.id=25 AND trip_measures.trip_id=trips.id;");
    $index=1;
    while($row=mysqli_fetch_array($zap))
    {
        echo "<tr><td>{$row['name']}</td><td>{$row['distance']}</td><td>{$row['measure_interval']}</td><td>",round($avg_spd[$index]),"</td></tr>";
        $index++;
    }
    echo "</table>";
    mysqli_close($connection);
}
?>
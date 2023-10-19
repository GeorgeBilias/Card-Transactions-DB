package com.example.myapplication;

import static androidx.core.content.PermissionChecker.checkSelfPermission;
import android.widget.TextView;
import android.Manifest;
import android.content.ContextWrapper;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.os.Bundle;
import android.os.Environment;
import android.os.Handler;
import android.os.Message;
import android.util.Log;
import android.widget.TextView;
import android.widget.Toast;

import androidx.activity.result.contract.ActivityResultContracts;
import androidx.annotation.NonNull;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;

import java.io.*;
import java.net.*;
import java.nio.charset.StandardCharsets;
import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.DocumentBuilder;
import org.w3c.dom.Document;
import org.w3c.dom.NodeList;
import org.w3c.dom.Node;
import org.w3c.dom.Element;
import org.w3c.dom.Text;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Scanner;

public class MyThread extends Thread{

    String filepath;
    Handler handler;
    TextView label;

    TextView label2;


    private static final String SERVER_ADDRESS = "192.168.1.22";
    private static final int PORT = 600;


    public MyThread(String filepath, Handler handler, TextView label, TextView label2){
        this.filepath = filepath;
        this.handler = handler;
        this.label = label;
        this.label2 = label2;
    }



    @Override
    public void run() {
        try {

            //Message msg = new Message();
            // Bundle bundle = new Bundle();
            //bundle.putString("result","Sent: "+arg);
            //msg.setData(bundle);


            // handler.sendMessage(msg);

            try {
                Log.d("myTag", "about to connect");
                Socket socket = null;
                try {
                    socket = new Socket(SERVER_ADDRESS, PORT);
                } catch (IOException e) {
                    throw new RuntimeException(e);
                }
                Log.d("myTag", "connnected");

                File file = new File(this.filepath);
                try (BufferedReader reader = new BufferedReader(new FileReader(file))) {
                    String line;
                    while ((line = reader.readLine()) != null) {
                        Log.e("PRINTING,", " PAPA: "+ line);
                        // System.out.println(line);
                    }
                } catch (IOException e) {
                    e.printStackTrace();
                }

                Log.e("KANONISE NA IPARXEIS","FINGERMASTER: "+this.filepath.trim());
                Log.e("KANONISE NA IPARXEIS","FINGERMASTER: "+file.exists());
                FileInputStream fileInput = new FileInputStream(file);
                byte[] fileData = new byte[(int) file.length()];
                fileInput.read(fileData);
                fileInput.close();
                String fileString = new String(fileData, StandardCharsets.UTF_8);

                // Write the file data to the server's output stream
                OutputStream outputStream = socket.getOutputStream();

                PrintWriter out = new PrintWriter(new OutputStreamWriter(outputStream, StandardCharsets.UTF_8), true);
                out.println(fileString);

                Log.e("h1","1");
                ObjectInputStream in = new ObjectInputStream(socket.getInputStream());
                Log.e("h2","2");





                while (true) { // keep looping until you receive the info

                    try {

                        resultInfo route_stats;
                        route_stats = (resultInfo) in.readObject();
                        Log.e("h3","3");
                        String route_stats_string;
                        route_stats_string ="Current route Activity stats: \n";

                        route_stats_string +="Total distance: "+route_stats.getTotalDistance()+" km\n";
                        route_stats_string +="Average Speed: "+route_stats.getAverageSpeed()*60*60 +" km/h\n";
                        route_stats_string +="Total Elevation: "+route_stats.getTotalelevation()+ " m\n";
                        route_stats_string += ("Total Time: " + route_stats.getTotalTime() + " sec");
                        label.setText(route_stats_string);
                        ArrayList<resultInfo> avg_stats = (ArrayList<resultInfo>) in
                                .readObject(); // read results
                        // System.out.println("-- Read from Master --\n");
                        // List<resultInfo> Map_results = (List<resultInfo>) in.readObject();

                        String user_stats;
                        user_stats ="\nUser stats: \n";
                        user_stats += "Average Exercise Time: " + avg_stats.get(0).getTotalTime() + " sec\n";
                        user_stats+="Average Distance Time: " + avg_stats.get(0).getTotalDistance() + " km\n";
                        user_stats+="Average Elevation Time: " + avg_stats.get(0).getTotalelevation()+ " meters\n\n";


                        user_stats+="Global Average Stats: \n";
                        user_stats+="Average Exercise Time: " + avg_stats.get(1).getTotalTime() + " sec\n";
                        user_stats+="Average Distance: " + avg_stats.get(1).getTotalDistance() + " km\n";
                        user_stats+="Average Elevation: " + avg_stats.get(1).getTotalelevation() + " meters\n";
                        label2.setText(user_stats);


                        Log.e("papaisabitch",user_stats);





                        break;
                    } catch (ClassNotFoundException e) {
                        System.out.println(e);
                    }
                }





                //outputStream.close(); // close connection with master
                socket.close();

            } catch (RuntimeException e) {
                throw new RuntimeException(e);
            } catch (IOException e) {
                throw new RuntimeException(e);
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }}}








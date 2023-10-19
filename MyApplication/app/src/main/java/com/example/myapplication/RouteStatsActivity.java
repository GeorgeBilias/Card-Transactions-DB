package com.example.myapplication;
import android.os.Bundle;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

public class RouteStatsActivity extends AppCompatActivity {

    private TextView label;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_route_stats);

        label = findViewById(R.id.label);

        String routeStatsString = getIntent().getStringExtra("route_stats_string");

        label.setText(routeStatsString);
    }
}


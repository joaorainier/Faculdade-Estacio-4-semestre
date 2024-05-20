package com.example.listadetarefas2;

import androidx.appcompat.app.AppCompatActivity;

import android.os.Bundle;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;
import android.widget.ListView;

public class MainActivity extends AppCompatActivity {
    private ArrayAdapter<String> tasksAdapter;
    private AudioHelper audioHelper;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        Button connectButton = findViewById(R.id.connectButton);

        tasksAdapter = new ArrayAdapter<>(this, android.R.layout.simple_list_item_1);
        audioHelper = new AudioHelper(this, tasksAdapter, connectButton);

        ListView taskListView = findViewById(R.id.taskListView);
        taskListView.setAdapter(tasksAdapter);

        connectButton.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                audioHelper.connectBluetooth();
            }
        });
    }
}
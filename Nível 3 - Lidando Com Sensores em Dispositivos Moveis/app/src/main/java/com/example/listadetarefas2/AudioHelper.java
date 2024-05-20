package com.example.listadetarefas2;

import static androidx.core.content.ContextCompat.startActivity;

import android.content.Context;
import android.content.Intent;
import android.content.pm.PackageManager;
import android.media.AudioDeviceCallback;
import android.media.AudioDeviceInfo;
import android.media.AudioManager;
import android.provider.Settings;
import android.view.View;
import android.widget.ArrayAdapter;
import android.widget.Button;

import java.util.Arrays;

public class AudioHelper {
    private final Context context;
    private final ArrayAdapter<String> tasksAdapter;
    private final Button button;
    public final AudioManager audioManager;

    public AudioHelper(Context context, ArrayAdapter<String> tasksAdapter,  Button button) {
        this.context = context;
        this.tasksAdapter = tasksAdapter;
        this.button = button;

        audioManager = (AudioManager) context.getSystemService(Context.AUDIO_SERVICE);

        audioManager.registerAudioDeviceCallback(new AudioDeviceCallback() {
            @Override
            public void onAudioDevicesAdded(AudioDeviceInfo[] addedDevices) {
                super.onAudioDevicesAdded(addedDevices);
                tasksAdapter.clear();
                tasksAdapter.add("Speaker: " + audioOutputAvailable(AudioDeviceInfo.TYPE_BUILTIN_SPEAKER));
                tasksAdapter.add("Bluetooth: " + audioOutputAvailable(AudioDeviceInfo.TYPE_BLUETOOTH_A2DP));

                button.setVisibility(View.INVISIBLE);
            }

            @Override
            public void onAudioDevicesRemoved(AudioDeviceInfo[] removedDevices) {
                super.onAudioDevicesRemoved(removedDevices);
                tasksAdapter.clear();
                tasksAdapter.add("Speaker: " + audioOutputAvailable(AudioDeviceInfo.TYPE_BUILTIN_SPEAKER));
                tasksAdapter.add("Bluetooth: " + audioOutputAvailable(AudioDeviceInfo.TYPE_BLUETOOTH_A2DP));

                button.setVisibility(View.VISIBLE);
            }
        }, null);
    }

    public void connectBluetooth() {
        Intent intent = new Intent(Settings.ACTION_BLUETOOTH_SETTINGS);
        intent.addFlags(Intent.FLAG_ACTIVITY_NEW_TASK);
        intent.addFlags(Intent.FLAG_ACTIVITY_CLEAR_TASK);
        intent.putExtra("EXTRA_CONNECTION_ONLY", true);
        intent.putExtra("EXTRA_CLOSE_ON_CONNECT", true);
        intent.putExtra("android.bluetooth.devicepicker.extra.FILTER_TYPE", 1);
        startActivity(context, intent, null);
    }

    public boolean audioOutputAvailable(int type) {
        if (!context.getPackageManager().hasSystemFeature(PackageManager.FEATURE_AUDIO_OUTPUT))
            return false;

        return Arrays.stream(audioManager.getDevices(AudioManager.GET_DEVICES_OUTPUTS)).anyMatch(s -> {
            return s.getType() == type;
        });
    }
}

package com.example.mybatterylevel

import android.content.Context
import android.content.ContextWrapper
import android.content.Intent
import android.content.IntentFilter
import android.os.BatteryManager
import android.os.Build


class AppDeviceHelperPlugin(var context: Context) : PigeonAppDeviceHelper.AppDeviceHelper {

    override fun getBatteryLevel(): Long {
        val batteryLevel: Int
        val intent = ContextWrapper(context).registerReceiver(null, IntentFilter(Intent.ACTION_BATTERY_CHANGED))
        batteryLevel = intent!!.getIntExtra(BatteryManager.EXTRA_LEVEL, -1) * 100 / intent.getIntExtra(BatteryManager.EXTRA_SCALE, -1)

        return batteryLevel.toLong()
    }

}
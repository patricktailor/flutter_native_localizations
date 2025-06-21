package com.patrikszabo.flutter_native_localizations

import android.annotation.SuppressLint
import android.content.Context
import android.content.res.Configuration
import android.content.res.Resources
import android.os.Build
import androidx.annotation.Keep

@Keep
class FlutterNativeLocalizationsPlugin(private val context: Context) {
  companion object {
    private const val KIND_STRING  = "string"
    private const val KIND_PLURALS = "plurals"
    private const val KIND_ARRAY   = "array"
  }

  private val resources: Resources get() = context.resources

  private val packageName: String get() = context.packageName

  @SuppressLint("DiscouragedApi")
  fun getString(resourceName: String): String? {
    val id = resources.getIdentifier(resourceName, KIND_STRING, packageName)
    return if (id != 0) {
      try {
        resources.getString(id)
      } catch (e: Resources.NotFoundException) {
        null
      }
    } else {
      null
    }
  }

  @SuppressLint("DiscouragedApi")
  fun getFormattedString(resourceName: String, vararg args: Any): String? {
    val id = resources.getIdentifier(resourceName, KIND_STRING, packageName)
    return if (id != 0) {
      try {
        resources.getString(id, *args)
      } catch (e: Resources.NotFoundException) {
        null
      }
    } else {
      null
    }
  }

  @SuppressLint("DiscouragedApi")
  fun getPlural(resourceName: String, quantity: Int): String? {
    val id = resources.getIdentifier(resourceName, KIND_PLURALS, packageName)
    return if (id != 0) {
      try {
        resources.getQuantityString(id, quantity)
      } catch (e: Resources.NotFoundException) {
        null
      }
    } else {
      null
    }
  }

  @SuppressLint("DiscouragedApi")
  fun getFormattedPlural(resourceName: String, quantity: Int, vararg args: Any): String? {
    val id = resources.getIdentifier(resourceName, KIND_PLURALS, packageName)
    return if (id != 0) {
      try {
        resources.getQuantityString(id, quantity, *args)
      } catch (e: Resources.NotFoundException) {
        null
      }
    } else {
      null
    }
  }

  @SuppressLint("DiscouragedApi")
  fun getStringArray(resourceName: String): Array<String>? {
    val id = resources.getIdentifier(resourceName, KIND_ARRAY, packageName)
    return if (id != 0) {
      try {
        resources.getStringArray(id)
      } catch (e: Resources.NotFoundException) {
        null
      }
    } else {
      null
    }
  }

  @SuppressLint("DiscouragedApi")
  fun getText(resourceName: String): CharSequence? {
    val id = resources.getIdentifier(resourceName, KIND_STRING, packageName)
    return if (id != 0) {
      try {
        resources.getText(id)
      } catch (e: Resources.NotFoundException) {
        null
      }
    } else {
      null
    }
  }

  /*
  @SuppressLint("DiscouragedApi")
  fun getFormattedText(resourceName: String, vararg args: Any): CharSequence? {
    val id = resources.getIdentifier(resourceName, KIND_STRING, packageName)
    return if (id != 0) {
      try {
        resources.getText(id, sequenceOf(*args))
      } catch (e: Resources.NotFoundException) {
        null
      }
    } else {
      null
    }
  }
  */

  @SuppressLint("DiscouragedApi")
  fun hasResourceName(resourceName: String, resourceType: String): Boolean {
    return resources.getIdentifier(resourceName, resourceType, packageName) != 0
  }

  @Suppress("DEPRECATION")
  fun getLocales(): Array<String> {
    return if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.N) {
      (0 until resources.configuration.locales.size()).map { resources.configuration.locales[it].toLanguageTag() }.toTypedArray()
    } else {
      arrayOf(resources.configuration.locale.toLanguageTag())
    }
  }

  fun isRTL(): Boolean {
    return resources.configuration?.layoutDirection == Configuration.SCREENLAYOUT_LAYOUTDIR_RTL
  }
}
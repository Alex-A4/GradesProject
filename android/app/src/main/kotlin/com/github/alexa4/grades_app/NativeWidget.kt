package com.github.alexa4.grades_app

import android.content.Context
import android.graphics.Color
import android.view.View
import android.widget.TextView
import io.flutter.plugin.platform.PlatformView

/// Нативный виджет, отображающий текст
class NativeWidget(context: Context, id: Int, creationParams: Map<String?, Any?>?) : PlatformView {
    private val textView: TextView = TextView(context)

    override fun getView(): View {
        return textView
    }

    override fun dispose() {}

    init {
        textView.textSize = 30f
        textView.setBackgroundColor(Color.rgb(255, 255, 255))
        val text: String? = creationParams?.get("text") as String?
        textView.text = text ?: "Rendered on a native Android view (id: $id)"
    }
}
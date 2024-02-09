package com.maui.demoapp

import android.app.Activity
import android.content.Context
import android.view.ViewGroup.LayoutParams.MATCH_PARENT
import android.widget.LinearLayout
import androidx.appcompat.app.AppCompatActivity
import androidx.compose.foundation.layout.Arrangement
import androidx.compose.foundation.layout.Column
import androidx.compose.foundation.layout.fillMaxSize
import androidx.compose.foundation.layout.fillMaxWidth
import androidx.compose.foundation.layout.size
import androidx.compose.material.Button
import androidx.compose.material.Tab
import androidx.compose.material.TabRow
import androidx.compose.material.Text
import androidx.compose.runtime.Composable
import androidx.compose.runtime.mutableStateOf
import androidx.compose.runtime.remember
import androidx.compose.ui.Alignment
import androidx.compose.ui.Modifier
import androidx.compose.ui.platform.LocalContext
import com.maui.binding.Binding
import com.maui.binding.StringCallback
import androidx.compose.runtime.getValue
import androidx.compose.runtime.setValue // only if using var
import androidx.compose.ui.unit.dp
import androidx.compose.ui.viewinterop.AndroidView
val binding = Binding()

@Composable
fun ContentView() {
    var tabIndex by remember { mutableStateOf(0) }

    val tabs = listOf("Flutter", "Test")

    Column(modifier = Modifier.fillMaxWidth()) {
        TabRow(selectedTabIndex = tabIndex) {
            tabs.forEachIndexed { index, title ->
                Tab(text = { Text(title) },
                    selected = tabIndex == index,
                    onClick = { tabIndex = index }
                )
            }
        }
        when (tabIndex) {
            0 -> FlutterView()
            1 -> TestView()
        }
    }
}

@Composable
fun TestView() {
    val context = LocalContext.current as Activity
    var result by remember { mutableStateOf<String?>(null) }

    Column(Modifier.fillMaxSize(), verticalArrangement = Arrangement.Center, horizontalAlignment = Alignment.CenterHorizontally) {
        result?.let {
            Text(it)
        } ?: run {
            Button(onClick = {
                result = "Loading ..."
                Binding().async(context, listOf("Hello", "world!"), StringCallbackImpl {
                    result = it
                })
            }) {
                Text("Async")
            }
        }
    }
}

class StringCallbackImpl(val callback: (String?) -> Unit) : StringCallback {
    override fun onResult(result: String) {
        callback(result)
    }
}

@Composable
fun FlutterView() {
    val activity = LocalContext.current as AppCompatActivity
    AndroidView(
        modifier = Modifier.fillMaxSize(), // Occupy the max size in the Compose UI tree
        factory = {
            // Creates view
            binding.getFlutterView(activity)
        },
        update = { view ->
            // View's been inflated or state read in this block has been updated
            // Add logic here if necessary

            // As selectedItem is read here, AndroidView will recompose
            // whenever the state changes
            // Example of Compose -> View communication
        }
    )
}
# tabataTimerApp

A tabata timer app.


## Dependencies
google_fonts
Read more at:

carousel_slider
Read more at: https://pub.dev/packages/carousel_slider

provider
Read more at: https://pub.dev/packages/provider

## Color scheme
### Colors:
#### Purple:
Color(0xff340068)
Color(0xff5200a3)

#### White: 
Color(0xffFFF8F0)

#### Blue:
Color(0xff7DCFB6)



### Gradients:



#### Yellow gradient
Used for navbar

```
LinearGradient(
              colors: [
                const Color(0xffff930f),
                const Color(0xfffff95b),
              ],

            ),
```

#### White gradient with shadow
Used as background for dragable settings sheet
```
RadialGradient(
            colors: [
              const Color(0xffFFF8F0),
              const Color(0xffFFF8F0),
              Colors.black,
              //const Color(0xffc9c5bf),
            ],
            radius: 1.8,
            center: FractionalOffset(0.5, 1),
          ),
```

#### White gradient
Used to be used for triangle buttons
```
RadialGradient(
      center: FractionalOffset(0.5, 0.5),
      colors: [
        const Color(0xffEFFFF8),
        const Color(0xffBDD7C6),
      ],
      tileMode: TileMode.mirror // repeats the gradient over the canvas
      )
```

Color notes:
Colors:
0xff998888


gradient: LinearGradient(
            begin: pointUp ? Alignment.bottomCenter: Alignment.topCenter,
            end: Alignment.center,
            // end: pointUp ? Alignment.topCenter : Alignment.bottomCenter,
            colors: [Color(0xff998888), Color(0xffFFF8F0)],
          ), 




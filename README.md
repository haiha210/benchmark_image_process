# Compare benchmark image process

- how to run:

```bash
ruby test_benchmark.rb
```

- result

```bash
benchmark bm
===============================================================================
       user     system      total        real
mini_magick  0.000000   0.004361   0.156548 (  0.056535)
image_processing/vips  0.044142   0.011637   0.055779 (  0.039973)

benchmark memory
===============================================================================
Calculating -------------------------------------
         mini_magick    17.624k memsize (     0.000  retained)
                       212.000  objects (     0.000  retained)
                        33.000  strings (     0.000  retained)
image_processing/vips
                         6.855k memsize (     0.000  retained)
                       129.000  objects (     0.000  retained)
                        15.000  strings (     0.000  retained)

Comparison:
image_processing/vips:       6855 allocated
         mini_magick:      17624 allocated - 2.57x more
```

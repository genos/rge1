#!/usr/bin/env bqn
U←•rand.Range⟜0
N←{1+(+´{+´1>+`U𝕩}¨𝕩⥊𝕨)÷𝕩}
•Show 10 N 1e6

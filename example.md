# Example
## Timespans
### Syntax
```
n unit
```
where n is a natural number and unit is either `day | days | month | months | year | years`
<!-- `nanosecond | microsecond | millisecond | second | minute | hour |day | month | year | decade | century` -->

### Times
```
01:00
```
Generates a Time object in 1 hour

```
01:30
```
Generates a Time object in 1 hour and 30 minutes

```
03:00
```
Generates a Time object in 3 hours

```
12:00
```
Generates a Time object in 12 hours


### days
#### Singular
```
1 day
```

#### Plural
```
n days
```

### months
#### Singular
```
1 month
```

#### Plural
```
n months
```

### Plus/minus
```
1 month + 1 day
```
This makes a timespan of 1 month and 1 day

```
1 month - 10 days
```
this generates a time object 10 days before 1 month from now

### Absolut time
#### Time setup 12 Hour format

```
current day at 02:00 AM
```
Returns a Time object at 2 AM today

```
current day at 11:30 AM
```
Returns a Time object at 11:30 AM today

```
current day at 06:00 PM
```
Returns a Time object at 6 PM today

#### Time setup 24 Hour format
```
current day at 02:00
```
Returns a Time object at 2 AM today

```
current day at 11:30
```
Returns a Time object at 11:30 AM today

```
current day at 18:00
```
Returns a Time object at 6 PM today

### Absolut time with timespan
```
1 day at 02:00 AM
```
Returns a Time object 1 day from now at 2:00 AM

### Absolut time with timespan
```
1 months + 10 days at 02:00 AM
```
Returns a Time object 1 month and 10 days from now at 2:00 AM

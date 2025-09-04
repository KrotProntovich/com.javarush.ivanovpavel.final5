package com.javarush.jira.bugtracking.task.to;

import lombok.*;

import java.time.LocalTime;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter @Setter
public class TimeTo {
    private String month;
    private String day;
    private LocalTime time;

    @Override
    public String toString() {
        return "TimeTo{" +
                "month=" + month +
                ", day=" + day +
                ", time=" + time +
                '}';
    }

}

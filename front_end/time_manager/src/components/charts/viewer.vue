<template>
  <div class="container">
    <div class="row mt-5">
      <div class="col">
        <h1 class="text-center">working times</h1>
      </div>
    </div>
    <div class="row mt-5" v-if="arrStart.length > 0">
      <div class="col">
        <h2 class="text-center">Starting times</h2>
        <line-chart
          :chartData="arrStart"
          :options="chartOptions"
          :chartColors="StartChartColors"
          label="Start"
        />
      </div>
    </div>

    <div class="row mt-5" v-if="arrLeave.length > 0">
      <div class="col">
        <h2 class="text-center">Leaving times</h2>
        <line-chart
          :chartData="arrLeaving"
          :options="chartOptions"
          :chartColors="LeaveChartColors"
          label="Leave"
        />
      </div>
    </div>

  </div>
</template>

<script>
import axios from "axios";
import moment from "moment";

import LineChart from "./LineChart";

export default {
  components: {
    LineChart
  },
  data() {
    return {
      arrStart: [],
      StartingChartColors: {
        borderColor: "#077187",
        pointBorderColor: "#0E1428",
        pointBackgroundColor: "#AFD6AC",
        backgroundColor: "#74A57F"
      },
      arrLeave: [],
      LeaveChartColors: {
        borderColor: "#251F47",
        pointBorderColor: "#260F26",
        pointBackgroundColor: "#858EAB",
        backgroundColor: "#858EAB"
      },
      chartOptions: {
        responsive: true,
        maintainAspectRatio: false
      }
    };
  },
  async created() {
    const { data } = await axios.get("");

    data.forEach(d => {
      const date = moment(d.date, "YYYYMMDD").format("MM/DD");
      const {
        startTime,
        LeaveTime,
      } = d;

      this.arrPositive.push({ date, total: startTime });
      this.arrLeave.push({ date, total: leaveTime});
    });
  }
};
</script>

<style>
</style>

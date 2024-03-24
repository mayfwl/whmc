<template>
  <baidu-map class="map" inertial-dragging center="武汉" zoom="15" :scroll-wheel-zoom="true"
    ><bm-scale anchor="BMAP_ANCHOR_BOTTOM_LEFT"></bm-scale
    ><bm-city-list anchor="BMAP_ANCHOR_TOP_LEFT"></bm-city-list
    ><bm-geolocation
      anchor="BMAP_ANCHOR_TOP_RIGHT"
      :showAddressBar="true"
      :autoLocation="true"
    ></bm-geolocation>
    <bm-navigation anchor="BMAP_ANCHOR_BOTTOM_RIGHT"></bm-navigation>

    <bm-marker
      v-for="i in trail"
      ::key="i.id"
      :position="{ lng: i.x, lat: i.y }"
      :dragging="false"
      :icon="{
        url: '/public/img/坐标-fill1.png',
        size: { width: 25, height: 25 }
      }"
      @click="openInfoWindow(i)"
    >
    </bm-marker>

    <bm-info-window
      :position="infoWindow.position"
      :show="infoWindow.show"
      @close="infoWindow.show = false"
      class="rounded-[20px]"
    >
      <div class="w-[220px] h-[240px] flex flex-col justify-center">
        <img class="w-[220px] object-cover" :src="infoWindow.content.himg" alt="" />
        <h4 class="m-0">{{ infoWindow.content.name }}</h4>
        <p class="m-0 text-[12px] text-[#616161]">
          {{ infoWindow.content.option }}{{ infoWindow.content.optype }}
        </p>
        <n-button type="primary" @click="$router.push('/trailinfo/' + infoWindow.content.id)"
          >查看详情</n-button
        >
      </div>
    </bm-info-window></baidu-map
  >
</template>
<script lang="ts" setup>
import { getTrails } from '@/service/api/trail'
import { ref } from 'vue'
let trail = ref<Trails.trails[]>([])
const Trails = async () => {
  const {
    data: { data }
  } = await getTrails()
  trail.value = data
}
Trails()
const infoWindow = ref({
  show: false,
  position: { lng: 0, lat: 0 },
  content: {} as Trails.trails
})
function openInfoWindow(marker: Trails.trails) {
  infoWindow.value.position = { lng: marker.x, lat: marker.y }
  infoWindow.value.show = true
  infoWindow.value.content = marker
}
</script>
<style lang="scss" scoped>
.map {
  width: 100%;
  height: 635px;
  margin-bottom: -32px;
}
</style>

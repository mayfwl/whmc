<template>
  <div class="w-full text-14px">
    <n-checkbox v-model:checked="checked">我已经仔细阅读并接受</n-checkbox>
    <n-button :text="true" type="primary">《用户协议》</n-button>
    <n-button :text="true" type="primary">《隐私权政策》</n-button>
  </div>
</template>

<script setup lang="ts">
import { computed } from 'vue'

interface Props {
  /** 是否勾选 */
  value?: boolean
}

const props = withDefaults(defineProps<Props>(), {
  value: true
})

interface Emits {
  (e: 'update:value', value: boolean): void
}

const emit = defineEmits<Emits>()

const checked = computed({
  get() {
    return props.value
  },
  set(newValue: boolean) {
    emit('update:value', newValue)
  }
})
</script>

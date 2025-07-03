import http from 'k6/http'
import { sleep, check } from 'k6'

export const options = {
    iterations: 10,
    vu: 2000000,
    duration: '30s',
}

export default function () {
    const res = http.get('')
    check(res, { 'status was 200': (r) => r.status == 200 })
    sleep(1)
}
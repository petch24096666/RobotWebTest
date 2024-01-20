import http from 'k6/http';
import { check, sleep } from 'k6';

export let options = {
  stages: [
    { duration: '30s', target: 20 }, // Stage 1
    { duration: '2m', target: 30 }, // Stage 2
    { duration: '1m', target: 10 }, // Stage 3
  ],
  thresholds: {
     http_req_failed: ['rate<0.01'], // http errors should be less than 1%
     http_req_duration: ['p(95)<500'], // 95% of requests should be below 200ms
  },
};

export default function () {
  // Test logic here
  let res = http.get('http://45.144.164.182:8080/');
  check(res, {
     'is status 200': (r) => r.status === 200,
     'body size is 11,105 bytes': (r) => r.body.length == 11105,
  });
  sleep(1);
}
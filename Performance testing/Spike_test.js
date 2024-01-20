import http from 'k6/http';
import { check, sleep } from 'k6';

export let options = {
  stages: [
    { duration: '1m', target: 100 }, // Stage 1
    { duration: '2m', target: 300 }, // Stage 2
    { duration: '30s', target: 1500 }, // Stage 3
  ],
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
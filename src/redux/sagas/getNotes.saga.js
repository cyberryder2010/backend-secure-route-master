import { put, takeLatest } from 'redux-saga/effects';
import axios from 'axios';

function* getNotes(action) {
  try {
    const config = {
      headers: { 'Content-Type': 'application/json' },
      withCredentials: true
    };

    const response = yield axios.get('/api/notes', config);
    yield put({
      type: 'SET_NOTES',
      payload: response.data
    })
  } catch(err) {
    console.warn(err);
  }
}

function* notesSaga() {
  yield takeLatest('GET_NOTES', getNotes);
}

export default notesSaga;
import * as types from './mutation-types'

export const setFoo = ({commit, state}, payload) => {
  commit(types.UPDATE_FOO, payload);
};

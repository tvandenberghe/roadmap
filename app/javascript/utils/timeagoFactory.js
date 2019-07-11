import enGB from 'locale/en_GB/timeago.js'; //remove ../ since we're using webpack and app/javascript is the start 

/* global timeago */
const TimeagoFactory = (() => {
  timeago.register('en_GB', enGB);
  /*
    @param el - DOM element
    @returns
  */
  return {
    render: (el) => {
      timeago.render(el, 'en_GB');
    },
  };
})();

export default TimeagoFactory;

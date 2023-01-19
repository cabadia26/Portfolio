import DevSection from "./components/DevSection";
/*import { Resume } from "./components/Resume";*/
import  Home  from "./components/Home";

const AppRoutes = [
  {
    index: true,
    element: <Home />
  },
  {
      path: '/devsection/:id',
      element: <DevSection />
    }
    ,
    {
        path: '/devsection/:id/:sub',
        element: <DevSection />
    }
];

export default AppRoutes;

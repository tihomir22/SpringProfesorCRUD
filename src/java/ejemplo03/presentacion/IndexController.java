package ejemplo03.presentacion;

import com.fpmislata.persistencia.dao.BussinessException;
import com.fpmislata.persistencia.dao.BussinessMessage;
import ejemplo03.dominio.Licencia;
import ejemplo03.dominio.Local;
import ejemplo03.persistencia.dao.LocalDAO;
import ejemplo03.persistencia.dao.LicenciaDAO;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Lorenzo González
 */
@Controller
public class IndexController {

    @Autowired
    private LicenciaDAO licenciaDAO;
    @Autowired
    private LocalDAO localDAO;

    @RequestMapping({"/index.html"})
    public ModelAndView listarLicencias(HttpServletRequest request, HttpServletResponse response) {
        Map<String, Object> model = new HashMap<String, Object>();
        String viewName;

        viewName = "index";

        return new ModelAndView(viewName, model);
    }

}
